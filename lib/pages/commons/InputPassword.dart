import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../data/config.dart';
import '../AreaUsuario/admin/adminPage.dart';
import '../AreaUsuario/cliente/AreaCliente.dart';
import '../AreaUsuario/profissional/AreaProfissionais.dart';

class InputPassword extends StatefulWidget {
  TextEditingController passControler;
  String email;
  bool isSecret;
  MaskTextInputFormatter normal;
  Function submited;
  InputPassword({
    Key? key,
    required this.email,
    required this.passControler,
    required this.isSecret,
    required this.normal,
    required this.submited,
  }) : super(key: key);

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
      decoration: BoxDecoration(
        border:
            Border.all(color: primaryColor, width: 2, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: TextFormField(
          textInputAction: TextInputAction.done,
          scrollPadding: EdgeInsets.all(40),
          controller: widget.passControler,
          obscureText: widget.isSecret,
          inputFormatters: [widget.normal],
          validator: (value) {
            if (value != null && value.length < 6) {
              return 'Senha menor que 6 Caracteres.';
            } else {
              return null;
            }
          },
          style: TextStyle(color: primaryColor),
          decoration: InputDecoration(
            isCollapsed: true,
            suffix: widget.isSecret
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.isSecret = !widget.isSecret;
                      });
                    },
                    child: Icon(
                      Icons.visibility,
                      color: primaryColor,
                    ))
                : GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.isSecret = !widget.isSecret;
                      });
                    },
                    child: Icon(
                      Icons.visibility_off,
                      color: primaryColor,
                    )),
            isDense: true,
            hintText: 'Senha',
            hintStyle: TextStyle(color: primaryColor),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
