import 'package:flutter/material.dart';
import 'package:temaqui/data/config.dart';

class NormalButtom extends StatefulWidget {
  NormalButtom({Key? key, required this.label}) : super(key: key);
  String label;
  @override
  State<NormalButtom> createState() => _NormalButtomState();
}

class _NormalButtomState extends State<NormalButtom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: primaryColor,
      ),
      height: 50,
      child: Text(
        widget.label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
