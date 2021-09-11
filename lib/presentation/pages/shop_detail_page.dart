import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:front/domain/models/shop/shop.dart';
import 'package:front/domain/repositories/shop_repository.dart';
import 'package:front/presentation/presenters/carousels/custom_carousel.dart';
import 'package:front/presentation/providers/shop_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ShopDatailPage extends HookWidget {
  const ShopDatailPage(this.label, this.name, {Key? key}) : super(key: key);
  final String label;
  final String name;

  @override
  Widget build(BuildContext context) {
    final selectedShop =
        StateNotifierProvider<ShopProvider, AsyncValue<Shop>>((_) => ShopProvider(ShopRepository(), label));
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Consumer(
        builder: (context, watch, child) {
          final AsyncValue<Shop> shop = watch(selectedShop);
          // AsyncValueでdata,loading,errorのハンドリングが可能
          return shop.when(
            data: (data) => Column(
              children: <Widget>[CustomCarousel(data.options)],
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (_, __) => const Center(
              child: Text('データの取得に失敗しました'),
            ),
          );
        },
      ),
    );
  }
}
