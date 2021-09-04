import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/main.dart';
import 'package:front/presentation/pages/next_page.dart';

class RouteGenerator {
  static const String top = '/';

  /// 1.ナビゲーション用の固有名追加
  static const String next = '/next';

  RouteGenerator._() {}

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      /// 2.ナビゲーション用の遷移追加
      case top:
        return MaterialPageRoute(
          builder: (_) => MyHomePage(),
        );
      case next:
        return MaterialPageRoute(
          builder: (_) => NextPage(),
        );
      // 該当しない場合エラー
      default:
        throw RouteException('Route not found');
    }
  }
}

class RouteException implements Exception {
  final String message;
  const RouteException(this.message);
}
