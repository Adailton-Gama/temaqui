import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/config.dart';

class UserDrawerTile extends StatefulWidget {
  UserDrawerTile({
    Key? key,
    required this.icon,
    required this.label,
    this.align = MainAxisAlignment.start,
    this.gradiente = true,
  }) : super(key: key);
  IconData icon;
  String label;
  MainAxisAlignment align;
  bool gradiente;
  @override
  State<UserDrawerTile> createState() => _UserDrawerTileState();
}

class _UserDrawerTileState extends State<UserDrawerTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, left: 10, right: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: Get.width,
      height: 40,
      alignment: Alignment.center,
      decoration: widget.gradiente
          ? BoxDecoration(
              gradient: appBarGradient,
              borderRadius: BorderRadius.circular(20),
            )
          : BoxDecoration(
              color: secundaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
      child: Row(
        mainAxisAlignment: widget.align,
        children: [
          Icon(
            widget.icon,
            color: widget.gradiente ? Colors.white : primaryColor,
          ),
          SizedBox(width: 10),
          Text(
            widget.label,
            style: TextStyle(
              color: widget.gradiente ? Colors.white : primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
