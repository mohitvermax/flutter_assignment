import 'package:flutter/material.dart';
import 'package:flutter_assignment/features/converter/bloc/converter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConverterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConverterBloc(),
      child: ConverterView(),
    );
  }
}

class ConverterView extends StatelessWidget {
  final TextEditingController _binaryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ConverterBloc converterBloc = BlocProvider.of<ConverterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Binary Converter'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: BlocBuilder<ConverterBloc, ConverterState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _binaryController,
                  decoration: InputDecoration(
                    labelText: 'Enter the binary number',
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    converterBloc
                        .add(ConvertBinaryEvent(_binaryController.text));
                  },
                  child: Text('Convert'),
                ),
                SizedBox(height: 15),
                Text(
                  'Converted Number is: ${state.convertedNumber}',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ConverterPage(),
  ));
}
