import 'package:flutter/material.dart';
import 'package:temaqui/data/config.dart';

// ignore: must_be_immutable
class BorderButtom extends StatefulWidget {
  BorderButtom({Key? key, required this.label}) : super(key: key);
  String label;

  @override
  State<BorderButtom> createState() => _BorderButtomState();
}

class _BorderButtomState extends State<BorderButtom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        widget.label,
        style: TextStyle(
          color: primaryColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
