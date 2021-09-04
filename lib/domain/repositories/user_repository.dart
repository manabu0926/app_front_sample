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
  var dio = Dio();
  final baseUserUrl = "${dotenv.env['BASE_URL']}/users";

  @override
  Future<dynamic> getCurrentUser(String idToken) async {
    try {
      String url = "$baseUserUrl/current";
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
      var result = await dio.get(baseUserUrl);
      return result.data;
    } on DioError catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<int?> addUser() async {
    try {
      var result = await dio.post(baseUserUrl);
      return result.statusCode;
    } on DioError catch (e) {
      throw CustomException(message: e.message);
    }
  }
}
