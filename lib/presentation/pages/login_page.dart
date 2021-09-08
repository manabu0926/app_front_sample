import 'package:flutter/material.dart';
import 'package:front/config/const/theme_word.dart';
import 'package:front/config/const/theme_color.dart';
import 'package:front/config/const/theme_spacer.dart';
import 'package:front/general_providers.dart';
import 'package:front/presentation/presenters/buttons/expanded_button.dart';
import 'package:front/presentation/presenters/dynamics/custom_snackbar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ThemeWord.login),
      ),
      body: Container(
        padding: ThemeSpacer.main,
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ExpandedButton(ThemeWord.loginGoogle, ThemeColor.main, () async {
                final isAuth = await context.read(authentication.notifier).signIn();
                if (isAuth) {
                  CustomSnackbar().showSnackBar(ThemeWord.signin, context);
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
