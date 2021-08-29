import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:front/main.dart';
import 'package:front/presenters/buttons/expanded_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Login extends HookWidget {
  Future<void> signInWithGoogle(loginState) async {
    // Trigger the authentication flow
    final googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      print('認証していない');
      return;
    }
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    credential.idToken;
    await FirebaseAuth.instance.signInWithCredential(credential);

    print(FirebaseAuth.instance.currentUser?.email);
    print(FirebaseAuth.instance.currentUser?.displayName);
    print(FirebaseAuth.instance.currentUser?.photoURL);
    loginState.state = true;
  }

  @override
  Widget build(BuildContext context) {
    final loginState = useProvider(loginStateProvider);
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
          ExpandedButton('ログイン', Colors.blue, () async {
            await signInWithGoogle(loginState);
            print(loginState.state);
            if (loginState.state == true) {
              print('ログイン成功');
            } else {
              print('ログイン失敗');
            }
          })
        ],
      ),
    );
  }
}
