import 'package:flutter/material.dart';
import 'package:flutter_assignment/features/converter/converter_page.dart';
import 'package:flutter_assignment/features/counter/counter_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  final _pages = [
    CounterPage(),
    ConverterPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 253, 249),
          title: const Text('Converter App'),
        ),
        body: _pages[_selectedIndex], // Display the selected page
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Color.fromARGB(255, 8, 154, 37),
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.format_list_numbered),
              label: 'Counter',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.format_align_left),
              label: 'Converter',
            ),
          ],
        ),
      ),
    );
  }
}
