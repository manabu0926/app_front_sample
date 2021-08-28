import 'package:flutter/material.dart';
import 'package:front/presenters/buttons/expanded_button.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new TextField(
            enabled: true,
            maxLength: 20,
            style: TextStyle(color: Colors.black),
            obscureText: false,
            maxLines: 1,
            decoration: const InputDecoration(
              labelText: '名前 *',
            ),
          ),
          new TextField(
            enabled: true,
            maxLength: 20,
            style: TextStyle(color: Colors.black),
            obscureText: true,
            maxLines: 1,
            decoration: const InputDecoration(
              labelText: 'パスワード *',
            ),
          ),
          ExpandedButton('ログイン', Colors.blue, () {})
        ],
      ),
    );
  }
}
