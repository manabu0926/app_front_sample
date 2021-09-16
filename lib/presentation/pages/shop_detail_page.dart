import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:front/config/const/theme_font.dart';
import 'package:front/config/const/theme_spacer.dart';
import 'package:front/config/gen/assets.gen.dart';
import 'package:front/domain/models/shop/shop.dart';
import 'package:front/domain/models/shop/shop_option.dart';
import 'package:front/domain/repositories/shop_repository.dart';
import 'package:front/presentation/presenters/buttons/circle_button.dart';
import 'package:front/presentation/presenters/carousels/custom_carousel.dart';
import 'package:front/presentation/providers/shop_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ShopDatailPage extends HookWidget {
  const ShopDatailPage(this.label, this.name, {Key? key}) : super(key: key);
  final String label;
  final String name;

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    ];
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
              children: <Widget>[CustomCarousel(imgList), shopButtonList(data.options)],
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

  Widget shopButtonList(List<ShopOption>? options) {
    List<Widget> buttonList = [
      CircleButton('お知らせ', const Icon(Icons.notifications_active, size: 50.0), () => {}),
      CircleButton('店舗HP', const Icon(Icons.domain, size: 50.0), () => {}),
      CircleButton('お知らせ', const Icon(Icons.favorite, size: 50.0), () => {})
    ];
    if (options != null) {
      for (ShopOption option in options) {
        buttonList.add(CircleButton('お知らせ', const Icon(Icons.favorite, size: 50.0), () => {}));
      }
    }

    return Wrap(
        alignment: WrapAlignment.start,
        spacing: 16.0, // gap between adjacent chips
        runSpacing: 16.0,
        children: buttonList);
  }
}
