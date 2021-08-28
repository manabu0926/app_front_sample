import 'package:flutter/material.dart';

class ExpandedButton extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final Function() onPressed;

  ExpandedButton(this.text, this.buttonColor, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: buttonColor, //ボタンの背景色
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
