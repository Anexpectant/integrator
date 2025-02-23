import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integrator/core/utils/services/di/injection.dart';
import 'package:integrator/core/utils/services/logger/logger.dart';
import 'package:integrator/core/utils/step_builder/data/step_controller_model.dart';
import 'package:integrator/core/utils/step_builder/domain/step_controller_cubit.dart';

enum Result { SUCCESS, FAILURE, CANCEL }

class StepWidgetChild {
  final Widget widget;
  final bool isBuilder;
  final int backCount;

  StepWidgetChild(this.widget, this.isBuilder, {this.backCount = 1});
}

typedef StepWidgetBuilder = StepWidgetChild Function(
    Map<String, dynamic> passedData);

StepWidgetChild stepWidgetCreator(
        {required Widget child, bool isBuilder = false, int backCount = 1}) =>
    StepWidgetChild(child, isBuilder, backCount: backCount);

typedef GoBack = void Function();

abstract class StepBuilder<T extends OnDone, E extends OnFailure>
    extends StatefulWidget {
  final T onDone;
  final E? failure;
  final GoBack? cancel;
  final bool reversible;

  const StepBuilder(
      {Key? key,
      required this.onDone,
      this.cancel,
      this.failure,
      this.reversible = true})
      : super(key: key);
}

abstract class StepBuilderState<T extends StepBuilder> extends State<T> {
  int index = 0;
  Map<String, dynamic> passedData = {};
  bool loading = false;
  late final List<StepWidgetBuilder> children;

  @override
  dispose() {
    getIt<Logger>().debug('inside step builder dispose');
    super.dispose();
  }

  endFlow({Result flowResult = Result.SUCCESS}) {
    switch (flowResult) {
      case Result.SUCCESS:
        widget.onDone(data: passedData);
        break;
      case Result.FAILURE:
        if (widget.failure != null) {
          widget.failure!();
          break;
        }
        Navigator.of(context).pop();
        break;
      case Result.CANCEL:
        if (widget.cancel != null) {
          widget.cancel!();
          break;
        }
        Navigator.of(context).pop();
        break;
    }
  }

  bool isFlowOver(
      {Result flowResult = Result.SUCCESS, required int nextIndex}) {
    if (nextIndex >= children.length || nextIndex < 0) {
      endFlow(flowResult: flowResult);
      return true;
    }
    return false;
  }

  next({Map<String, dynamic>? data, BuildContext? context}) {
    if (isFlowOver(nextIndex: index + 1)) return;

    setState(() {
      index++;
      this.passedData.addAll(data ?? {});
    });
  }

  doubleNext({Map<String, dynamic>? data, BuildContext? context}) {
    getIt<Logger>().debug('in double next stepBuilder, index: ' + index.toString());

    if (isFlowOver(nextIndex: index + 2)) return;
    setState(() {
      index += 2;
      this.passedData.addAll(data ?? {});
    });
  }

  fromBegin() {
    setState(() {
      index = 0;
    });
  }

  back() {
    getIt<Logger>().debug('in back stepBuilder, index: ' + index.toString());

    if (isFlowOver(nextIndex: index - 1, flowResult: Result.CANCEL)) return;
    setState(() {
      index-=children[index](passedData).backCount;
    });
  }

  startLoading() {
    setState(() {
      loading = true;
    });
  }

  endLoading() {
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<StepControllerCubit, StepControllerState>(
        listener: (context, state) {
          if (children[index](passedData).isBuilder)
            return;
          else if (state is NextStepState) {
            next();
          } else if (state is BackStepState) {
            back();
          } else if (state is FromBeginState) {
            fromBegin();
          } else if (state is EndFlowState) endFlow();
        },
        child: loading
            ? Container()
            : Container(child: children[index](passedData).widget));
  }
}