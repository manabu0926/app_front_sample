import 'dart:async';

import 'package:front/domain/models/shop/shop.dart';
import 'package:front/domain/repositories/shop_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ShopProvider extends StateNotifier<AsyncValue<Shop>> {
  ShopProvider(this.repository, this.label) : super(const AsyncValue.loading()) {
    _getShop();
  }

  final ShopRepository repository;
  final String label;

  Future<void> _getShop() async {
    try {
      // final Openapi _openApi = OpenApiFactory().build();
      // final repository = _openApi.getShopsApi();
      // final response = (await repository.getShops()).data;
      Shop shop = await repository.getShop(label);
      state = AsyncValue.data(shop);
    } on Exception catch (e) {
      state = AsyncValue.error(e);
    }
  }
}
