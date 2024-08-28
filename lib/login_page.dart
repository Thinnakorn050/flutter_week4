import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String _message = '';

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == 'admin' && password == '1234') {
      setState(() {
        _message = 'สวัสดีไอสัส เสียงน้าค่อม';
      });
    } else {
      setState(() {
        _message = 'Wrong username or password';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page',
        style: TextStyle(color: Color.fromARGB(255, 229, 222, 222))),
        backgroundColor: Color.fromARGB(255, 202, 12, 75), 
        ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
            SizedBox(height: 20),
            Text(
              _message,
              style: TextStyle(color: _message == 'สวัสดีไอสัส เสียงน้าค่อม' ? Color.fromARGB(255, 67, 94, 69) : Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}