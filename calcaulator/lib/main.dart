import 'package:calcaulator/calculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      routes: {
        Calculator_App.routeName: (buildContext) {
          return Calculator_App();
        }
      },
      initialRoute: Calculator_App.routeName,
    );
  }
}
