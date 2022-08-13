import 'package:flutter/material.dart';

class CustomTextForm extends StatefulWidget {
  CustomTextForm(
      {Key? key,
      this.isObscure = false,
      required this.userControler,
      required this.label})
      : super(key: key);
  final TextEditingController userControler;
  bool isObscure;
  String label;
  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: widget.userControler,
        obscureText: widget.isObscure,
        style: TextStyle(color: Colors.orange),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                  color: Colors.orange, width: 2, style: BorderStyle.solid)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                  color: Colors.orange, width: 2, style: BorderStyle.solid)),
          label: Text(
            widget.label,
            style: TextStyle(color: Colors.orange),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                  color: Colors.orange, width: 2, style: BorderStyle.solid)),
        ),
      ),
    );
  }
}
