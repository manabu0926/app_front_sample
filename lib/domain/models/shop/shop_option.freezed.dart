// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'shop_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ShopOption _$ShopOptionFromJson(Map<String, dynamic> json) {
  return _ShopOption.fromJson(json);
}

/// @nodoc
class _$ShopOptionTearOff {
  const _$ShopOptionTearOff();

  _ShopOption call({required String name, required String url}) {
    return _ShopOption(
      name: name,
      url: url,
    );
  }

  ShopOption fromJson(Map<String, Object> json) {
    return ShopOption.fromJson(json);
  }
}

/// @nodoc
const $ShopOption = _$ShopOptionTearOff();

/// @nodoc
mixin _$ShopOption {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShopOptionCopyWith<ShopOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopOptionCopyWith<$Res> {
  factory $ShopOptionCopyWith(
          ShopOption value, $Res Function(ShopOption) then) =
      _$ShopOptionCopyWithImpl<$Res>;
  $Res call({String name, String url});
}

/// @nodoc
class _$ShopOptionCopyWithImpl<$Res> implements $ShopOptionCopyWith<$Res> {
  _$ShopOptionCopyWithImpl(this._value, this._then);

  final ShopOption _value;
  // ignore: unused_field
  final $Res Function(ShopOption) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ShopOptionCopyWith<$Res> implements $ShopOptionCopyWith<$Res> {
  factory _$ShopOptionCopyWith(
          _ShopOption value, $Res Function(_ShopOption) then) =
      __$ShopOptionCopyWithImpl<$Res>;
  @override
  $Res call({String name, String url});
}

/// @nodoc
class __$ShopOptionCopyWithImpl<$Res> extends _$ShopOptionCopyWithImpl<$Res>
    implements _$ShopOptionCopyWith<$Res> {
  __$ShopOptionCopyWithImpl(
      _ShopOption _value, $Res Function(_ShopOption) _then)
      : super(_value, (v) => _then(v as _ShopOption));

  @override
  _ShopOption get _value => super._value as _ShopOption;

  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
  }) {
    return _then(_ShopOption(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShopOption with DiagnosticableTreeMixin implements _ShopOption {
  const _$_ShopOption({required this.name, required this.url});

  factory _$_ShopOption.fromJson(Map<String, dynamic> json) =>
      _$_$_ShopOptionFromJson(json);

  @override
  final String name;
  @override
  final String url;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ShopOption(name: $name, url: $url)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ShopOption'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('url', url));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ShopOption &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(url);

  @JsonKey(ignore: true)
  @override
  _$ShopOptionCopyWith<_ShopOption> get copyWith =>
      __$ShopOptionCopyWithImpl<_ShopOption>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ShopOptionToJson(this);
  }
}

abstract class _ShopOption implements ShopOption {
  const factory _ShopOption({required String name, required String url}) =
      _$_ShopOption;

  factory _ShopOption.fromJson(Map<String, dynamic> json) =
      _$_ShopOption.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get url => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ShopOptionCopyWith<_ShopOption> get copyWith =>
      throw _privateConstructorUsedError;
}
