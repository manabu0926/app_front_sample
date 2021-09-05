import 'package:firebase_auth/firebase_auth.dart';
import 'package:front/domain/custom_exception.dart';
import 'package:front/providers/firebase_authentication.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 抽象クラスを定義
abstract class BaseAuthRepository {
  // ログイン状態の確認用（ログイン状態の変更や初期化時にイベントする）
  Stream<User?> get authStateChanges;

  // サインイン（著名ユーザを作成）
  Future<void> signInWithGoogle();
  // 現在サインインしているユーザを取得する。
  User? getCurrentUser();
  // ログアウト
  Future<void> signOut();
}

// 認証リポジトリクラス
class AuthRepository implements BaseAuthRepository {
  // riverpod Reader
  // アプリ内の他のプロバイダーを読み取ることを許可
  final Reader _read;

  const AuthRepository(this._read);

  // Readerを利用して、firebaseAuth.instanceにアクセス
  @override
  Stream<User?> get authStateChanges => _read(firebaseAuthProvider).authStateChanges();

  // Googleでログイン
  @override
  Future<void> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        return;
      }
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _read(firebaseAuthProvider).signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  // 既存の匿名ユーザを返却
  @override
  User? getCurrentUser() {
    try {
      return _read(firebaseAuthProvider).currentUser;
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  // サインアウトしたら、新たに匿名ユーザでログインさせる。
  @override
  Future<void> signOut() async {
    try {
      // サインアウト
      await _read(firebaseAuthProvider).signOut();
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }
}
