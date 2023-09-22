import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListTileProfilePage extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  const ListTileProfilePage(
      {super.key, required this.leadingIcon, required this.title});

  @override
  Widget build(BuildContext context) {
    return listItem();
  }

  Widget listItem() {
    return Platform.isIOS
        ? CupertinoListTile(
            onTap: () {},
            leading: Icon(
              leadingIcon,
              size: 40,
            ),
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
          )
        : ListTile(
            onTap: () {},
            leading: Icon(
              leadingIcon,
              size: 40,
            ),
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
          );
  }
}
