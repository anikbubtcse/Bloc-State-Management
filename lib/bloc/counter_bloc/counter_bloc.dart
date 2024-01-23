import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<CounterEventEcho>((event, emit) async {
      // Calculation

      emit(CounterEchoLoading());

      final finalVal = event.echoValue;
      String sum = finalVal + finalVal;

      await Future.delayed(const Duration(seconds: 5));

      emit(CounterStateEchoLoaded(sum));
    });
  }
}
