import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:temaqui/data/config.dart';
import 'package:temaqui/data/config.dart' as config;

class CustomTextForm extends StatefulWidget {
  CustomTextForm({
    Key? key,
    this.isObscure = false,
    required this.userControler,
    required this.label,
    this.padding = 20,
    required this.mask,
    this.type = TextInputType.name,
    this.acao = TextInputAction.next,
  }) : super(key: key);
  final TextEditingController userControler;
  bool isObscure;
  String label;
  double padding;
  MaskTextInputFormatter mask;
  TextInputType type;
  TextInputAction acao;
  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: widget.padding),
      child: TextFormField(
        textInputAction: widget.acao,
        scrollPadding: EdgeInsets.all(40),
        controller: widget.userControler,
        keyboardType: widget.type,
        obscureText: widget.isObscure,
        inputFormatters: [widget.mask],
        onTap: () {
          setState(() {});
        },
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
