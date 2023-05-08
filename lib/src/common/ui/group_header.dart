import 'package:flutter/material.dart';

class GroupHeader extends StatelessWidget {
  const GroupHeader(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColorLight,
      child: Column(
        children: [
          //const Divider(height: 1),
          ListTile(title: Text(title)),
          //const Divider(height: 1),
        ],
      ),
    );
  }
}
