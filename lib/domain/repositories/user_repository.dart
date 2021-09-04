import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:front/domain/custom_exception.dart';

// 抽象クラスを定義
abstract class BaseUserRepository {
  Future<dynamic>? getCurrentUser(String idToken);
  Future<List<dynamic>> getUsers();
  void addUser();
}

// 認証リポジトリクラス
class UserRepository implements BaseUserRepository {
  var dio = new Dio();

  @override
  Future<dynamic> getCurrentUser(String idToken) async {
    try {
      final baseUrl = dotenv.env['BASE_URL'];
      String url = "${baseUrl}/users/current";
      Options options = Options(headers: {'authorization': "Bearer $idToken"});
      var result = await dio.get(url, options: options);
      return result.data;
    } on DioError catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<List<dynamic>> getUsers() async {
    try {
      // final user = _read(firebaseAuthProvider).currentUser;
      const String BASE_URL = 'http://localhost:8082';
      String url = "${BASE_URL}/users";
      var result = await dio.get(url);
      return result.data;
    } on DioError catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<int?> addUser() async {
    try {
      // final user = _read(firebaseAuthProvider).currentUser;
      const String BASE_URL = 'http://localhost:8082';
      String url = "${BASE_URL}/users";
      var result = await dio.post(url);
      return result.statusCode;
    } on DioError catch (e) {
      throw CustomException(message: e.message);
    }
  }
}
