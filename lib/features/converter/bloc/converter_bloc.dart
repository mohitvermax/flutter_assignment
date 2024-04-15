import 'package:flutter_bloc/flutter_bloc.dart';

part 'converter_event.dart';
part 'converter_state.dart';

class ConverterBloc extends Bloc<ConverterEvent, ConverterState> {
  ConverterBloc() : super(ConverterState(0));

  Stream<ConverterState> mapEventToState(ConverterEvent event) async* {
    if (event is ConvertBinaryEvent) {
      int? value = int.tryParse(event.binaryInput, radix: 2);
      if (value != null) {
        yield ConverterState(value);
      } else {
        // Handle invalid input
      }
    }
  }
}
