import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:front/general_providers.dart';
import 'package:front/repositories/auth_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// @see: https://teech-lab.com/flutter-dartfirebase-authentication-anonymous/1704/?utm_source=rss&utm_medium=rss&utm_campaign=flutter-dartfirebase-authentication-anonymous
final authControllerProvider = StateNotifierProvider<AuthController, User?>(
  (ref) => AuthController(ref.read)..appStarted(),
);

class AuthController extends StateNotifier<User?> {
  final Reader _read;

  StreamSubscription<User?>? _authStateChangesSubscription;

  AuthController(this._read) : super(null) {
    // 受信停止
    _authStateChangesSubscription?.cancel();
    // 受信開始
    _authStateChangesSubscription =
        _read(authRepositoryProvider).authStateChanges.listen((user) async {
      state = user;
      if (user != null) {
        // final idToken = await user.getIdToken();
        // final currentUser = await UserApi().getUser(idToken);
        _read(loginStateProvider).state = true;
      } else {
        _read(loginStateProvider).state = false;
      }
    });
  }

  // 不要な受信をキャンセルするためにdisposeでキャンセルする
  @override
  void dispose() {
    _authStateChangesSubscription?.cancel();
    super.dispose();
  }

  // アプリ開始
  void appStarted() async {
    // Currentユーザを取得
    final user = _read(authRepositoryProvider).getCurrentUser();
    if (user == null) {
      print('null更新した');
    } else {
      print(user.displayName);
    }
  }

  // サインイン
  void signIn() async {
    await _read(authRepositoryProvider).signInWithGoogle();
  }

  // サインアウト
  void signOut() async {
    // サインアウトメソッド
    await _read(authRepositoryProvider).signOut();
  }
}
