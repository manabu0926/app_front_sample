import 'package:flutter/material.dart';
import 'package:front/config/const/theme_spacer.dart';

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("次のページ"),
      ),
      body: Container(
        padding: ThemeSpacer.main,
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("次のページ"),
            ],
          ),
        ),
      ),
    );
  }
}
