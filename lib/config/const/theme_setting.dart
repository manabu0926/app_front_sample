import 'package:dio/dio.dart';

class ThemeSetting {
  static final baseOptions = BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: 6 * 1000, // 60 seconds
      receiveTimeout: 6 * 1000 // 60 seconds
      );
}
