## Flutterアプリ作成サンプルテンプレート
firestoreのDBではなく、api通信を使用して別でサーバーを立てる際の参考として作成しました。

- FirebaseAuthentication
- OpenApi(dockerで立ち上げるように管理)
- Riverpod(state管理)
- freezed(モデルクラスのimmutableなオブジェクト用のコード生成をしてくれる)
- flutter_lint
- flutter_gen(assets配下リソースへのアクセス設定ファイルを生成)
- 定数管理
- DDDっぽいフォルダ構成

で構成したテンプレートです。

## 立ち上げ方法
### iphoneのシミュレーター立ち上げ方法

```
$ cp .env.default .env
$ flutter pub get
$ open -A Simulator
$ cd  ./openapi ; docker-compose up --build
$ flutter run
```

### openapiのデータ更新方法
```
$ openapi-generator generate -i openapi/openapi.yml -g openapi-yaml -o ./openapi/generated
```

### freezedのデータ作成方法
```
$ flutter packages pub run build_runner build --delete-conflicting-outputs
```
※ freezedについての参考
- https://note.com/mxiskw/n/n55441444bd46
- https://techgamelife.net/2021/02/20/flutter-freezed-easy-use/

### flutter_genの設定方法
```
$ brew install FlutterGen/tap/fluttergen
$ fluttergen 

```
※ flutter_genの資料
- https://wasabeef.medium.com/fluttergen-25149caea94f