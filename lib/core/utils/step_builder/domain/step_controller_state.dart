part of 'step_controller_cubit.dart';

@immutable
abstract class StepControllerState extends Equatable {

  StepControllerState();
}

class EmptyStepState extends StepControllerState {
  @override
  List<Object?> get props => [];
}

class NextStepState extends StepControllerState {
  final Map<String, dynamic>? data;

  NextStepState(this.data);

  @override
  List<Object?> get props => [];
}

class BackStepState extends StepControllerState {
  @override
  List<Object?> get props => [];
}

class FromBeginState extends StepControllerState {
  @override
  List<Object?> get props => [];
}

class EndFlowState extends StepControllerState {
  @override
  List<Object?> get props => [];
}