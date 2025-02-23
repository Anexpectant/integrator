import 'package:flutter/cupertino.dart';
import 'package:integrator/core/utils/services/alert_handler/failures.dart';

typedef OnDone = void Function(
    {Map<String, dynamic>? data, BuildContext? context});
typedef OnFailure = void Function({Failure? failure});

class StepController {
  int currentIndex;
  final OnDone onDone;

  StepController({required this.onDone, this.currentIndex = 0});
}