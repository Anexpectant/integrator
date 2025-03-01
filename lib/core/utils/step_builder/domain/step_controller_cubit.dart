import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'step_controller_state.dart';

@injectable
class StepControllerCubit extends Cubit<StepControllerState> {
  StepControllerCubit() : super(EmptyStepState());

  back() {
    emit(BackStepState());
    emit(EmptyStepState());
  }

  next({Map<String, dynamic>? data}) {
    emit(NextStepState(data));
    emit(EmptyStepState());
  }

  fromBegin() {
    emit(FromBeginState());
    emit(EmptyStepState());
  }

  endFlow() {
    emit(EndFlowState());
    emit(EmptyStepState());
  }
}