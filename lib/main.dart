import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:front/general_providers.dart';
import 'package:front/presentation/pages/login_page.dart';
import 'package:front/presentation/pages/top_page.dart';
import 'package:front/presentation/presenters/modals/full_display_loading.dart';
import 'package:front/routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dotenv.load(fileName: '.env');
  await SentryFlutter.init(
    (options) {
      options.dsn = dotenv.env['SENTRY_DSN'];
    },
    appRunner: () => runApp(
      const ProviderScope(child: MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Auth Template',
      debugShowCheckedModeBanner: true,
      initialRoute: RouteGenerator.top, // routes.dart依存
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends HookWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = useProvider(authenticationProvider);
    final loading = useProvider(loadingProvider);
    return Stack(alignment: Alignment.center, children: [
      WillPopScope(onWillPop: () async => false, child: currentUser == null ? const LoginPage() : const TopPage()),
      FullDisplayLoading(visible: loading.state),
    ]);
  }
}
