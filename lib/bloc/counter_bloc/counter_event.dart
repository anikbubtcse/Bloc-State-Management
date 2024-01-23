part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();
}

// input definition

class CounterEventEcho extends CounterEvent {
  final String echoValue;

  const CounterEventEcho({required this.echoValue});

  @override
  List<Object?> get props => [echoValue];
}
