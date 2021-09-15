import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'shop_option.freezed.dart';
part 'shop_option.g.dart';

@freezed
class ShopOption with _$ShopOption {
  const factory ShopOption({
    required String name,
    required String url,
  }) = _ShopOption;
  factory ShopOption.fromJson(Map<String, dynamic> json) => _$ShopOptionFromJson(json);
}
