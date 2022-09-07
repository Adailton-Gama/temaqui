import 'package:flutter/material.dart';
import 'package:temaqui/data/config.dart';

import 'styles.dart';

class MenuItemPage extends StatefulWidget {
  MenuItemPage({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);
  final IconData icon;
  final String label;

  @override
  State<MenuItemPage> createState() => _MenuItemPageState();
}

class _MenuItemPageState extends State<MenuItemPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        child: Row(
          children: <Widget>[
            Icon(
              widget.icon,
              color: primaryColor,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              widget.label,
              style: TextStyle(
                color: primaryColor,
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
