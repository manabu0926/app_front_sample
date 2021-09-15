// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Shop _$_$_ShopFromJson(Map<String, dynamic> json) {
  return _$_Shop(
    name: json['name'] as String,
    logo: json['logo'] as String,
    label: json['label'] as String,
    images:
        (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
    options: (json['options'] as List<dynamic>?)
        ?.map((e) => ShopOption.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_ShopToJson(_$_Shop instance) => <String, dynamic>{
      'name': instance.name,
      'logo': instance.logo,
      'label': instance.label,
      'images': instance.images,
      'options': instance.options,
    };
