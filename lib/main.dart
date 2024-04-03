import 'package:flutter/material.dart';
import 'custom_text_widget.dart';
import 'custom_button_widget.dart';
import 'circular_progress_widget.dart';
import 'custom_uno_widget.dart';
import 'custom_dropdown_widget.dart';
import 'assets.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'UNO Picker by Wiridlangit'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _showImage = false;
  final Map<String, List<String>> _imagePaths = Assets.imagePaths;
  String _currentColor = 'Blue';
  int _currentIndex = 0;

final List<String> _colors = ['Blue', 'Green', 'Red', 'Yellow'];

void _incrementCounter() {
  if (_counter < 18) {
    setState(() {
      _showImage = true;
      _currentIndex = _counter % (_imagePaths[_currentColor]?.length ?? 0);
      _counter++;
    });
    print('Counter: $_counter');
  }
}

void _randomizeImage() {
  setState(() {
    final random = Random();
    _currentColor = _colors[random.nextInt(_colors.length)];
    _currentIndex = random.nextInt(_imagePaths[_currentColor]?.length ?? 0);
    _showImage = true;
  });
}

  void _resetCounter() {
    setState(() {
      _counter = 0;
      _showImage = false;
      _currentIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CustomTextWidget(
                text: 'Check all of your cards here!', fontSize: 24.0),
            const SizedBox(height: 20.0),
            CircularProgressWidget(value: _counter / 18.0),
            const SizedBox(height: 20.0),
            CustomButtonWidget(
              onPressed: _incrementCounter,
              buttonText: 'Check Card',
            ),
            const SizedBox(height: 20.0),
            CustomButtonWidget(
              onPressed: _resetCounter,
              buttonText: 'Reset',
            ),
            const SizedBox(height: 20.0),
            CustomButtonWidget(
              onPressed: _randomizeImage,
              buttonText: 'Randomize',
            ),
            const SizedBox(height: 20.0),
            CustomDropdownWidget(
              value: _currentColor,
              onChanged: (String? newValue) {
              setState(() {
              _currentColor = newValue!;
              _currentIndex = 0;
              });
              },
            items: _colors,
              ),

            if (_showImage)
              CustomUnoWidget(
                 imagePaths: _imagePaths[_currentColor]!, currentIndex: _currentIndex),
          ],
        ),
      ),
    );
  }
}
