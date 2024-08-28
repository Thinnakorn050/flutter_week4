// ---------------------------LOGIN-------------------------//
import 'package:flutter/material.dart';
import 'login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

//---------------------------calculator--------------------------//

// import 'package:flutter/material.dart';
// import 'calculator_page.dart';

// void main() {
//   runApp(MyApp());
// }
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Calculator Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: CalculatorPage(), 
//     );
//   }
// }