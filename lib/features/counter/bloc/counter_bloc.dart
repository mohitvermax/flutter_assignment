import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0, false)) {
    on<IncrementEvent>(incrementEvent);
    on<DecrementEvent>(decrementEvent);
    on<ToggleBinaryEvent>(toggleBinaryEvent);
  }

  FutureOr<void> incrementEvent(
      IncrementEvent event, Emitter<CounterState> emit) {
    emit(CounterState(state.count + 1, state.isBinary));
  }

  FutureOr<void> decrementEvent(
      DecrementEvent event, Emitter<CounterState> emit) {
    emit(CounterState(state.count - 1, state.isBinary));
  }

  FutureOr<void> toggleBinaryEvent(
      ToggleBinaryEvent event, Emitter<CounterState> emit) {
    emit(CounterState(state.count, !state.isBinary));
  }
}
