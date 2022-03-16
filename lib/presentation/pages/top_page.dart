import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:front/config/const/theme_word.dart';
import 'package:front/general_providers.dart';
import 'package:front/presentation/pages/next_page.dart';
import 'package:front/presentation/presenters/buttons/floating_round_button.dart';
import 'package:front/presentation/presenters/cards/list_card.dart';
import 'package:front/presentation/presenters/dynamics/custom_snackbar.dart';
import 'package:front/presentation/providers/shop_list_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TopPage extends ConsumerWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ThemeWord.top),
        leading: IconButton(
            onPressed: () {
              ref.read(authentication.notifier).signOut();
              CustomSnackbar().showSnackBar(ThemeWord.signout, context);
            },
            icon: const Icon(Icons.logout)),
      ),
      body: _List(),
      floatingActionButton: const FloatingRoundButton(NextPage()),
    );
  }
}

class _List extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // stateはhooksで管理
    final shopsList = ref.watch(shopList);

    return Consumer(
      builder: (context, ref, child) {
        // AsyncValueでdata,loading,errorのハンドリングが可能
        return shopsList.when(
          data: (data) => ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, int position) =>
                  ListCard(data[position].name, data[position].label, data[position].label)),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (_, __) => const Center(
            child: Text('データの取得に失敗しました'),
          ),
        );
      },
    );
  }
}
