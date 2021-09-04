import 'package:flutter/material.dart';

class FloatingRoundButton extends StatelessWidget {
  final Widget page;

  const FloatingRoundButton(this.page, {Key? key}) : super(key: key);

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
