import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:front/config/const/theme_setting.dart';
import 'package:front/domain/custom_exception.dart';
import 'package:front/domain/models/shop/shop.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

// 抽象クラスを定義
abstract class BaseShopRepository {
  Future<List<Shop>> getShops();
  Future<Shop> getShop(String label);
}

// 認証リポジトリクラス
class ShopRepository implements BaseShopRepository {
  Dio dio = Dio(ThemeSetting.baseOptions);
  final baseShopUrl = '${dotenv.env['BASE_URL']}/shops';

  @override
  Future<List<Shop>> getShops() async {
    try {
      List result = (await dio.get(baseShopUrl)).data;
      List<Shop> shops = [];
      for (var shop in result) {
        shops.add(Shop.fromJson(shop));
      }

      return shops;
    } on DioError catch (e, stackTrace) {
      Sentry.captureException(e, stackTrace: stackTrace);
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<Shop> getShop(String label) async {
    try {
      final url = '$baseShopUrl/label';
      print(url);
      dynamic result = (await dio.get('$baseShopUrl/label')).data;
      print(result);
      Shop shop = Shop.fromJson(result);

      return shop;
    } on DioError catch (e, stackTrace) {
      Sentry.captureException(e, stackTrace: stackTrace);
      throw CustomException(message: e.message);
    }
  }
}
