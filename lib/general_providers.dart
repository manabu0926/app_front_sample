import 'package:firebase_auth/firebase_auth.dart';
import 'package:front/providers/firebase_authentication.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseAuthenticationProvider =
    StateNotifierProvider<FirebaseAuthentication, User?>(
        (ref) => FirebaseAuthentication(ref.read));
final titleStateProvider = StateProvider<String>((ref) => 'トップ');
