import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:front/domain/repositories/auth_repository.dart';
import 'package:front/general_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// @see: https://teech-lab.com/flutter-dartfirebase-authentication-anonymous/1704/?utm_source=rss&utm_medium=rss&utm_campaign=flutter-dartfirebase-authentication-anonymous
final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

// AuthRepositoryを提供し、ref.readを渡してアクセスできるようにする
final authRepositoryProvider =
    Provider<AuthRepository>((ref) => AuthRepository(ref.read));

class FirebaseAuthentication extends StateNotifier<User?> {
  final Reader _read;

  StreamSubscription<User?>? _authStateChangesSubscription;

  FirebaseAuthentication(this._read) : super(null) {
    // 受信停止
    _authStateChangesSubscription?.cancel();
    // 受信開始
    _authStateChangesSubscription =
        _read(authRepositoryProvider).authStateChanges.listen((user) async {
      state = user;
      if (user != null) {
        print("いるよ");
        // final idToken = await user.getIdToken();
        // final currentUser = await UserApi().getUser(idToken);
      } else {
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
