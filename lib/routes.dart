import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/main.dart';
import 'package:front/presentation/pages/next_page.dart';

class RouteGenerator {
  static const String top = '/';
  static const String next = '/next';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case top:
        return MaterialPageRoute(builder: (_) => const MyHomePage());
      case next:
        return MaterialPageRoute(builder: (_) => const NextPage());
      // 該当しない場合エラー
      default:
        throw const RouteException('Route not found');
    }
  }
}

class RouteException implements Exception {
  final String message;
  const RouteException(this.message);
}
