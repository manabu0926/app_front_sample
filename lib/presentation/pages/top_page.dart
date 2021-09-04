import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:front/general_providers.dart';
import 'package:front/presentation/pages/next_page.dart';
import 'package:front/presentation/presenters/buttons/floating_round_button.dart';
import 'package:front/presentation/presenters/cards/list_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TopPage extends HookWidget {
  const TopPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final titleState = useProvider(titleStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(titleState.state),
        leading: IconButton(
            onPressed: () =>
                context.read(firebaseAuthenticationProvider.notifier).signOut(),
            icon: const Icon(Icons.logout)),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            ListCard('タイトル', 'サブタイトルをここに記載します', NextPage()),
            ListCard('タイトル', 'サブタイトルをここに記載します', NextPage()),
          ],
        ),
      ),
      floatingActionButton: const FloatingRoundButton(NextPage()),
    );
  }
}
