import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:front/controllers/auth_controller.dart';
import 'package:front/general_providers.dart';
import 'package:front/pages/login/login_page.dart';
import 'package:front/presenters/buttons/expanded_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: true,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final authControllerState = useProvider(authControllerProvider);
    final titleState = useProvider(titleStateProvider);
    return authControllerState == null
        ? LoginPage()
        : Scaffold(
            appBar: AppBar(
              title: Text(titleState.state),
            ),
            body: Container(
              padding: EdgeInsets.all(10.0),
              child: Center(
                  child: ExpandedButton('ログアウト', Colors.grey, () async {
                context.read(authControllerProvider.notifier).signOut();
              })),
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
