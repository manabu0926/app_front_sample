import 'package:front/domain/models/user.dart';
import 'package:front/presentation/providers/authentication.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authenticationProvider = StateNotifierProvider<Authentication, User?>((ref) => Authentication(ref.read));
final titleStateProvider = StateProvider<String>((ref) => 'トップ');
final loadingProvider = StateProvider<bool>((ref) => false);
