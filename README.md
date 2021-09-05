## Flutterアプリ作成サンプルテンプレート
firestoreのDBではなく、api通信を使用して別でサーバーを立てる際の参考として作成しました。

- FirebaseAuthentication
- OpenApi(dockerで立ち上げるように管理)
- Riverpod
- flutter_lint
- 定数管理
- 多言語対応
- DDDっぽいフォルダ構成

で構成したテンプレートです。

## 立ち上げ方法
### iphoneのシミュレーター立ち上げ方法

```
flutter pub get
open -A Simulator
cd  ./openapi ; docker-compose up --build
flutter run
```

### openapiのデータ更新方法
```
openapi-generator generate -i openapi/openapi.yml -g openapi-yaml -o ./openapi/generated
```