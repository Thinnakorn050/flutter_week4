import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  String _result = '';
  String _errorMessage = '';

  void _calculate(String operation) {
    double num1 = double.tryParse(_controller1.text) ?? 0;
    double num2 = double.tryParse(_controller2.text) ?? 0;

    if (_controller1.text.isEmpty || _controller2.text.isEmpty) {
      setState(() {
        _errorMessage = 'Please input both numbers';
        _result = '';
      });
      return;
    }

    if (double.tryParse(_controller1.text) == null ||
        double.tryParse(_controller2.text) == null) {
      setState(() {
        _errorMessage = 'Please input only numbers';
        _result = '';
      });
      return;
    }

    double result;

    switch (operation) {
      case 'Sum':
        result = num1 + num2;
        _errorMessage = '';
        _result = 'Result: $result';
        break;
      case 'Power':
        result = pow(num1, num2).toDouble();
        _errorMessage = '';
        _result = 'Result: $result';
        break;
      default:
        result = 0;
        _errorMessage = '';
        _result = 'Result: $result';
    }

    setState(() {});
  }

  void _clear() {
    _controller1.clear();
    _controller2.clear();
    setState(() {
      _result = '';
      _errorMessage = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator',
            style: TextStyle(color: Color.fromARGB(255, 229, 222, 222))),
        backgroundColor: Color.fromARGB(255, 17, 4, 130), 
      ),
      backgroundColor: Color.fromARGB(255, 242, 236, 236), 
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _controller1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Number 1',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _controller2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Number 2',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => _calculate('Sum'),
                  child: Text('Sum'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow, 
                    foregroundColor: Color.fromARGB(255, 18, 16, 16), 
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => _calculate('Power'),
                  child: Text('Power'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: const Color.fromARGB(255, 16, 15, 15), 
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _clear,
                  child: Text('Clear'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: const Color.fromARGB(255, 14, 13, 13), 
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                _result.isEmpty ? _errorMessage : _result,
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}