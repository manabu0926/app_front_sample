import 'package:flutter/material.dart';
import 'package:front/controllers/auth_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginModel {
  Future<void> signIn(BuildContext context) async {
    context.read(authControllerProvider.notifier).signIn();
  }
}
