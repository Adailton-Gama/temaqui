import 'package:flutter/material.dart';
import 'package:temaqui/data/config.dart';

class CustomTextForm extends StatefulWidget {
  CustomTextForm(
      {Key? key,
      this.isObscure = false,
      required this.userControler,
      required this.label,
      this.padding = 20})
      : super(key: key);
  final TextEditingController userControler;
  bool isObscure;
  String label;
  double padding;
  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: widget.padding),
      child: TextFormField(
        scrollPadding: EdgeInsets.all(40),
        controller: widget.userControler,
        obscureText: widget.isObscure,
        style: TextStyle(color: primaryColor),
        decoration: InputDecoration(
          isDense: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                  color: primaryColor, width: 2, style: BorderStyle.solid)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                  color: primaryColor, width: 2, style: BorderStyle.solid)),
          label: Text(
            widget.label,
            style: TextStyle(color: primaryColor),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
                color: primaryColor, width: 2, style: BorderStyle.solid),
          ),
        ),
      ),
    );
  }
}
