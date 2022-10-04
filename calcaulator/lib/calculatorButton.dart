import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CalculatorButton extends StatelessWidget {
  String text;
  Function onBtnClick;
  Color backGround = Colors.orange;
  CalculatorButton(
    this.text,
    this.onBtnClick,
  );

  @override
  Widget build(BuildContext context) {
    return (Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child: Container(
          margin: EdgeInsets.all(5.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: backGround),
            onPressed: () {
              onBtnClick(text);
            },
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
        ),
      ),
    ));
  }
}
