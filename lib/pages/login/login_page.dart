import 'package:flutter/material.dart';
import 'package:front/pages/login/login_model.dart';
import 'package:front/presenters/buttons/expanded_button.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ログイン"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ExpandedButton('Googleでログイン', Colors.blue, () async {
                LoginModel().signIn(context);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
