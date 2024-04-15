import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'converter_event.dart';
part 'converter_state.dart';

class ConverterBloc extends Bloc<ConverterEvent, ConverterState> {
  ConverterBloc() : super(ConverterState(0)) {
    on<ConvertBinaryEvent>(convertBinaryEvent);
  }

  FutureOr<void> convertBinaryEvent(
      ConvertBinaryEvent event, Emitter<ConverterState> emit) {
    int? value = int.tryParse(event.binaryInput, radix: 2);
    if (value != null) {
      emit(ConverterState(value));
    }
  }
}
