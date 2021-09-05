import 'package:flutter/material.dart';
import 'package:front/config/const/theme_spacer.dart';

class ListCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget page;

  const ListCard(this.title, this.subtitle, this.page, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => page,
              fullscreenDialog: true,
            ),
          );
        },
        child: SizedBox(
          width: double.infinity,
          height: 100,
          child: Padding(
            padding: ThemeSpacer.main,
            child: ListTile(
              leading: const Icon(Icons.shop, size: 50),
              title: Text(title),
              subtitle: Text(subtitle),
            ),
          ),
        ),
      ),
    );
  }
}
