import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:front/domain/models/user.dart';
import 'package:front/domain/repositories/auth_repository.dart';
import 'package:front/domain/repositories/user_repository.dart';
import 'package:front/general_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// @see: https://teech-lab.com/flutter-dartfirebase-authentication-anonymous/1704/?utm_source=rss&utm_medium=rss&utm_campaign=flutter-dartfirebase-authentication-anonymous
final firebaseAuthProvider = Provider<firebase_auth.FirebaseAuth>((ref) => firebase_auth.FirebaseAuth.instance);

// final userProvider = StateProvider<User?>((ref) => null);

// AuthRepositoryを提供し、ref.readを渡してアクセスできるようにする
final authRepositoryProvider = Provider<AuthRepository>((ref) => AuthRepository(ref.read));

class Authentication extends StateNotifier<User?> {
  // User? currentUser = null;
  final Reader _read;

  StreamSubscription<firebase_auth.User?>? _authStateChangesSubscription;

  Authentication(this._read) : super(null) {
    // 受信停止
    _authStateChangesSubscription?.cancel();
    // 受信開始
    _authStateChangesSubscription = _read(authRepositoryProvider).authStateChanges.listen((user) async {
      final loading = _read(loadingProvider);
      loading.state = true;
      if (user != null) {
        String idToken = await user.getIdToken();
        User currentUser = await UserRepository().getCurrentUser(idToken);
        state = currentUser;
      } else {
        state = null;
      }
      loading.state = false;
    });
  }

  // 不要な受信をキャンセルするためにdisposeでキャンセルする
  @override
  void dispose() {
    _authStateChangesSubscription?.cancel();
    super.dispose();
  }

  // サインイン
  Future<bool> signIn() async {
    final loading = _read(loadingProvider);
    loading.state = true;
    final isAuth = await _read(authRepositoryProvider).signInWithGoogle();

    if (!isAuth) {
      // 認証成功時にはapi取得後にloadingを解除したいので、ここでは認証失敗時のみloadingを解除する
      loading.state = false;
    }

    return isAuth;
  }

  // サインアウト
  void signOut() async {
    // サインアウトメソッド
    await _read(authRepositoryProvider).signOut();
  }
}
