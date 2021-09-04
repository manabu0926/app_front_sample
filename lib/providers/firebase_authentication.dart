import 'dart:async';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuthn;
import 'package:front/domain/repositories/auth_repository.dart';
import 'package:front/domain/repositories/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

// @see: https://teech-lab.com/flutter-dartfirebase-authentication-anonymous/1704/?utm_source=rss&utm_medium=rss&utm_campaign=flutter-dartfirebase-authentication-anonymous
final firebaseAuthProvider = Provider<FirebaseAuthn.FirebaseAuth>(
    (ref) => FirebaseAuthn.FirebaseAuth.instance);

// final userProvider = StateProvider<User?>((ref) => null);

// AuthRepositoryを提供し、ref.readを渡してアクセスできるようにする
final authRepositoryProvider =
    Provider<AuthRepository>((ref) => AuthRepository(ref.read));

class FirebaseAuthentication extends StateNotifier<FirebaseAuthn.User?> {
  // User? currentUser = null;
  final Reader _read;

  StreamSubscription<FirebaseAuthn.User?>? _authStateChangesSubscription;

  FirebaseAuthentication(this._read) : super(null) {
    // 受信停止
    _authStateChangesSubscription?.cancel();
    // 受信開始
    _authStateChangesSubscription =
        _read(authRepositoryProvider).authStateChanges.listen((user) async {
      state = user;
      if (user != null) {
        print("いるよ");
        String idToken = await user.getIdToken();
        dynamic currentUser = await UserRepository().getCurrentUser(idToken);
        print(currentUser);
      } else {
        // currentUser = null;
        print("いないよ");
      }
    });
  }

  // 不要な受信をキャンセルするためにdisposeでキャンセルする
  @override
  void dispose() {
    _authStateChangesSubscription?.cancel();
    super.dispose();
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
