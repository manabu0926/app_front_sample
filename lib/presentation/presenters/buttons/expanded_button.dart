import 'package:flutter/material.dart';

class ExpandedButton extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final Function() onPressed;

  const ExpandedButton(this.text, this.buttonColor, this.onPressed, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: buttonColor, //ボタンの背景色
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
