import 'dart:async';

import 'package:front/domain/models/shop/shop.dart';
import 'package:front/domain/repositories/shop_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final shopList =
    StateNotifierProvider<ShopListProvider, AsyncValue<List<Shop>>>((_) => ShopListProvider(ShopRepository()));

class ShopListProvider extends StateNotifier<AsyncValue<List<Shop>>> {
  ShopListProvider(this.repository) : super(const AsyncValue.loading()) {
    _getRegisterShops();
  }

  final ShopRepository repository;

  Future<void> _getRegisterShops() async {
    try {
      // var shops = await ShopRepository().getShops();
      List<Shop> shops = await repository.getShops();
      state = AsyncValue.data(shops);
    } on Exception catch (e) {
      state = AsyncValue.error(e);
    }
  }
}
