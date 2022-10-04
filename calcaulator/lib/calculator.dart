import 'dart:ffi';
import 'dart:math';

import 'package:calcaulator/calculatorButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Calculator_App extends StatefulWidget {
  static const String routeName = 'main';
  @override
  State<Calculator_App> createState() => _Calculator_AppState();
}

class _Calculator_AppState extends State<Calculator_App> {
  String resultText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: null,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 13.0),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Text(
                      resultText,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton('C', onDeleteClicked),
                CalculatorButton('7', onDigitClick),
                CalculatorButton('8', onDigitClick),
                CalculatorButton('9', onDigitClick),
                CalculatorButton('+', onOperatorClick),
              ],
            )),
            Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(
                  '4',
                  onDigitClick,
                ),
                CalculatorButton(
                  '5',
                  onDigitClick,
                ),
                CalculatorButton(
                  '6',
                  onDigitClick,
                ),
                CalculatorButton('-', onOperatorClick),
              ],
            )),
            Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(
                  '1',
                  onDigitClick,
                ),
                CalculatorButton(
                  '2',
                  onDigitClick,
                ),
                CalculatorButton(
                  '3',
                  onDigitClick,
                ),
                CalculatorButton('*', onOperatorClick),
              ],
            )),
            Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton('0', onDigitClick),
                CalculatorButton('.', onDigitClick),
                CalculatorButton('/', onOperatorClick),
                CalculatorButton('=', onEqualClick),
              ],
            )),
          ],
        ),
      ),
    );
  }
/////////// Function //////////

  void onDigitClick(String btnText) {
    resultText += btnText;
    setState(() {});
  }

  String operator = '';
  String res = '';
  void onOperatorClick(String clickedOperator) {
    if (operator.isEmpty) {
      operator = clickedOperator;
      res = resultText;
      resultText = '';
      setState(() {});
    } else {
      String newValue = resultText;
      res = calculate(res, operator, newValue);
      operator = clickedOperator;
      resultText = '';
      setState(() {});
    }
  }

  String calculate(String lsn, String operator, String newValue) {
    // lsn هو الرقم الاول
    // operator  هو القيمة + - * /
    // newValue هو الرقم الثاني
    double number1 = double.parse(lsn);
    double number2 = double.parse(newValue);
    double res = 0;
    if (operator == '+') {
      res = (number1 + number2);
    } else if (operator == '-') {
      res = (number1 - number2);
    } else if (operator == '*') {
      res = (number1 * number2);
    } else if (operator == '/') {
      res = number1 / number2;
    }
    return res.toString();
  }

  void onEqualClick(String s) {
    String newValue = resultText;
    res = calculate(res, operator, newValue);
    resultText = res;
    operator = '';
    res = '';
    setState(() {});
  }

  void onDeleteClicked(String s) {
    resultText = '';
    setState(() {});
  }

  
}
