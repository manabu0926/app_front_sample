import 'package:front/domain/models/user/user.dart';
import 'package:front/presentation/providers/authentication_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// いろんな画面からアクセスされそうなグローバルな変数はここに定義しておくとわかりやすそう
final authentication = StateNotifierProvider<AuthenticationProvider, User?>((ref) => AuthenticationProvider(ref.read));
final nowLoading = StateProvider<bool>((ref) => false);
