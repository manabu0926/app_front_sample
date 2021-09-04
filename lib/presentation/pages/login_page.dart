import 'package:flutter/material.dart';
import 'package:front/general_providers.dart';
import 'package:front/presentation/presenters/buttons/expanded_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ログイン"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
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
