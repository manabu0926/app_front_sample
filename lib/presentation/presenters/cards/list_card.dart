import 'package:flutter/material.dart';
import 'package:front/config/const/theme_spacer.dart';
import 'package:front/config/gen/assets.gen.dart';
import 'package:front/presentation/pages/shop_detail_page.dart';

class ListCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String label;

  const ListCard(this.title, this.subtitle, this.label, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShopDatailPage(label, title),
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
              leading: Assets.images.icon.image(
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              title: Text(title),
              subtitle: Text(subtitle),
            ),
          ),
        ),
      ),
    );
  }
}
