import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temaqui/data/config.dart';

class ChatTile extends StatefulWidget {
  ChatTile(
      {Key? key,
      this.selecionado = false,
      required this.icon,
      required this.label})
      : super(key: key);
  bool selecionado;
  String icon;
  String label;
  @override
  State<ChatTile> createState() => _ChatTileState();
}

class _ChatTileState extends State<ChatTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: widget.selecionado ? primaryColor : Colors.transparent,
      ),
      child: Row(
        children: [
          Image.asset(
            '${widget.icon}',
            height: Get.size.height / 8,
          ),
          Text(
            widget.label,
            style: TextStyle(
                color: widget.selecionado ? Colors.white : Colors.black,
                fontFamily: 'Arial',
                decoration: TextDecoration.none,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
