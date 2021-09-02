import 'package:flutter/material.dart';

class FloatingRoundButton extends StatelessWidget {
  final Widget page;

  FloatingRoundButton(this.page);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => page,
            fullscreenDialog: true,
          ),
        );
      },
    );
  }
}
