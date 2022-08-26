import 'package:flutter/material.dart';
import 'package:temaqui/data/config.dart';

// ignore: must_be_immutable
class BorderButtom extends StatefulWidget {
  BorderButtom({
    Key? key,
    required this.label,
    this.alignment = Alignment.center,
    this.fontSize = 20,
    this.menu = false,
  }) : super(key: key);
  String label;
  Alignment alignment;
  double fontSize;
  bool menu;

  @override
  State<BorderButtom> createState() => _BorderButtomState();
}

class _BorderButtomState extends State<BorderButtom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: widget.alignment,
      padding: EdgeInsets.all(10),
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        widget.label,
        style: TextStyle(
          color: primaryColor,
          fontSize: widget.fontSize,
          fontWeight:
              widget.fontSize == 20 ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
