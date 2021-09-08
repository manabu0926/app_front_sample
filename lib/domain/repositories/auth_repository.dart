import 'package:firebase_auth/firebase_auth.dart';
import 'package:front/domain/custom_exception.dart';
import 'package:front/presentation/providers/authentication_provider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

// 抽象クラスを定義
abstract class BaseAuthRepository {
  Stream<User?> get authStateChanges;
  Future<void> signInWithGoogle();
  User? getCurrentUser();
  Future<void> signOut();
}

// リポジトリクラス
class AuthRepository implements BaseAuthRepository {
  // riverpod Reader
  // アプリ内の他のプロバイダーを読み取ることを許可
  final Reader _read;

  const AuthRepository(this._read);

  // Readerを利用して、firebaseAuth.instanceにアクセス
  @override
  Stream<User?> get authStateChanges => _read(firebaseAuthentication).authStateChanges();

  // Googleでログイン
  @override
  Future<bool> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        return false;
      }
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _read(firebaseAuthentication).signInWithCredential(credential);

      return true;
    } on FirebaseAuthException catch (e, stackTrace) {
      Sentry.captureException(e, stackTrace: stackTrace);
      throw CustomException(message: e.message);
    }
  }

  @override
  User? getCurrentUser() {
    try {
      return _read(firebaseAuthentication).currentUser;
    } on FirebaseAuthException catch (e, stackTrace) {
      Sentry.captureException(e, stackTrace: stackTrace);
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      // サインアウト
      await _read(firebaseAuthentication).signOut();
    } on FirebaseAuthException catch (e, stackTrace) {
      Sentry.captureException(e, stackTrace: stackTrace);
      throw CustomException(message: e.message);
    }
  }
}
