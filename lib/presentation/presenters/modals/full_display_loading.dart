import 'package:flutter/material.dart';

class FullDisplayLoading extends StatelessWidget {
  const FullDisplayLoading({required this.visible, Key? key}) : super(key: key);

  final bool visible;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return visible
        ? Container(
            width: size.width,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.4),
            ),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Container();
  }
}
