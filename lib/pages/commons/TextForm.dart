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
    required this.validacao,
  }) : super(key: key);
  final TextEditingController userControler;
  bool isObscure;
  String label;
  double padding;
  MaskTextInputFormatter mask;
  TextInputType type;
  TextInputAction acao;
  Function validacao;
  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: widget.padding),
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: TextFormField(
          textInputAction: widget.acao,
          scrollPadding: EdgeInsets.all(40),
          controller: widget.userControler,
          keyboardType: widget.type,
          obscureText: widget.isObscure,
          inputFormatters: [widget.mask],
          validator: (value) {
            if (widget.label == 'E-mail') {
              if (value == null ||
                  value.isEmpty ||
                  value.contains(' ') == true ||
                  value.contains('@') == false ||
                  value.contains('.com') == false) {
                widget.userControler.text.replaceAll(' ', '');
                return 'Favor Corrigir o e-mail';
              }
            } else if (widget.label == 'Senha') {
              if (value != null && value.length < 6) {
                return 'Senha menor que 6 Caracteres!';
              }
            } else if (widget.label == 'Nome Completo') {
              if (value != null && value.length < 10) {
                return 'Por Favor Digitar o nome completo!';
              }
            } else if (widget.label == 'Telefone') {
              if (value != null && value.length < 15) {
                return 'Por Favor Digitar o telefone corretamente!';
              }
            } else if (widget.label == 'CPF') {
              if (value != null && value.length < 14) {
                return 'Por Favor Digitar o nome completo!';
              }
            } else if (widget.label == 'Data de Nascimento') {
              if (value != null && value.length < 10) {
                return 'Por Favor data de nascimento completa!';
              }
            } else if (widget.label == 'Endereço') {
              if (value != null && value.length < 15) {
                return 'Favor Digitar endereço completo!';
              }
            }
          },
          onTap: () {
            setState(() {});
          },
          style: TextStyle(color: primaryColor),
          decoration: InputDecoration(
            suffix: Icon(
              Icons.abc,
              color: Colors.transparent,
            ),
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
      ),
    );
  }
}
