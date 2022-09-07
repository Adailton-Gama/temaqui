import 'package:flutter/material.dart';
import 'package:temaqui/data/config.dart';

class NormalButtom extends StatefulWidget {
  NormalButtom(
      {Key? key,
      required this.label,
      this.height = 50,
      this.width = 50,
      required this.color,
      this.labelColor = Colors.white})
      : super(key: key);
  String label;
  double height;
  double width;
  Color color;
  Color labelColor;
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
        color: widget.color,
      ),
      height: widget.height,
      width: widget.width,
      child: Text(
        widget.label,
        style: TextStyle(
          color: widget.labelColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
