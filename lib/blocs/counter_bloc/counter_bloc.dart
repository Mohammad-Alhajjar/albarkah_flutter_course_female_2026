import 'package:bloc_example/blocs/counter_bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0;
  CounterBloc() : super(InitCounter()) {
    
    on<IncreamentCounter>((event, emit) {
      counter++;
      emit(CounterHasIncreamented(newValueOfCounterafterAdding: counter));
    });

    on<DecreamentCounter>((event, emit) {
      counter--;
      emit(CounterHasDecreamented(newValueOfCounterafterSub: counter));
    });

    on<ResetCounter>((event, emit) {
      counter = 0;
      emit(CounterHasReset());
    });
  }
}
