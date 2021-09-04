import 'package:flutter/material.dart';
import 'package:front/general_providers.dart';
import 'package:front/presentation/presenters/buttons/expanded_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
              ExpandedButton(
                  'Googleでログイン',
                  Colors.blue,
                  () async => context
                      .read(firebaseAuthenticationProvider.notifier)
                      .signIn()),
            ],
          ),
        ),
      ),
    );
  }
}
