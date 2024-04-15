part of 'converter_bloc.dart';

abstract class ConverterEvent {}

class ConvertBinaryEvent extends ConverterEvent {
  final String binaryInput;

  ConvertBinaryEvent(this.binaryInput);
}
