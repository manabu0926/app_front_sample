import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget page;

  ListCard(this.title, this.subtitle, this.page);

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
            padding: EdgeInsets.all(10.0),
            child: ListTile(
              leading: Icon(Icons.shop, size: 50),
              title: Text(title),
              subtitle: Text(subtitle),
            ),
          ),
        ),
      ),
    );
  }
}
