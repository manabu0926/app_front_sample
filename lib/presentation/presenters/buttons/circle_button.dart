import 'package:flutter/material.dart';
import 'package:front/config/const/theme_font.dart';

class CircleButton extends StatelessWidget {
  final String text;
  final Icon icon;
  final Function() onPressed;

  const CircleButton(this.text, this.icon, this.onPressed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20.0),
        primary: Colors.white,
        onPrimary: Colors.black,
        shape: const CircleBorder(),
      ),
      onPressed: () => {},
      child: Column(
        children: [
          ClipOval(child: icon),
          Text(
            text,
            style: ThemeFont.circleButtonText,
          )
        ],
      ),
    );
  }
}
