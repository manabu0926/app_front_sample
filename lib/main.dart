import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:front/pages/login.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

final titleStateProvider = StateProvider((ref) => 'トップ');

class MyHomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final titleState = useProvider(titleStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(titleState.state),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Login(),
      ),
      floatingActionButton: FloatingActionButton(
        // ボタンを押したとき
        onPressed: () {
          titleState.state = "こんにちは世界";

          print("ボタン押下");
        },
      ),
    );
  }
}
