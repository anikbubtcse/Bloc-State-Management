part of 'counter_bloc.dart';

// Output Definition
abstract class CounterState extends Equatable {
  const CounterState();
}

class CounterInitial extends CounterState {
  @override
  List<Object> get props => [];
}

class CounterEchoLoading extends CounterState {
  @override
  List<Object> get props => [];
}


class CounterStateEchoLoaded extends CounterState {
  final String echoValue;

  const CounterStateEchoLoaded(this.echoValue);

  @override
  List<Object?> get props => [echoValue];
}
