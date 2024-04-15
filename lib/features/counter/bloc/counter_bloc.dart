import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0, false));

  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is IncrementEvent) {
      yield CounterState(state.count + 1, state.isBinary);
    } else if (event is DecrementEvent) {
      yield CounterState(state.count - 1, state.isBinary);
    } else if (event is ToggleBinaryEvent) {
      yield CounterState(state.count, !state.isBinary);
    }
  }
}
