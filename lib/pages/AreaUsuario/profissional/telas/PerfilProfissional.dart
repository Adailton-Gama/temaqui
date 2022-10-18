import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:temaqui/data/config.dart';
import 'package:temaqui/pages/AreaUsuario/profissional/telas/perfilBronze.dart';
import 'package:temaqui/pages/AreaUsuario/profissional/telas/perfilOuro.dart';
import 'package:temaqui/pages/AreaUsuario/profissional/telas/perfilPrata.dart';
import 'package:temaqui/pages/commons/TextForm.dart';

class PerfilProfissional extends StatefulWidget {
  var usuario;
  PerfilProfissional({Key? key, required this.usuario}) : super(key: key);

  @override
  State<PerfilProfissional> createState() => _PerfilProfissionalState();
}

class _PerfilProfissionalState extends State<PerfilProfissional> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdDados();
  }

  @override
  //
  var cpf;
  var telefone;
  String? plano;
  var autorizado;
  //
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            //AppBar
            Container(
              height: 60,
              width: Get.size.width,
              decoration: BoxDecoration(
                gradient: appBarGradient,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.of(context).pop();
                      });
                    },
                    child: Ink(
                      height: 50,
                      width: 80,
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    'Perfil Profissional',
                    style: TextStyle(
                        fontFamily: 'Arial',
                        decoration: TextDecoration.none,
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ],
              ),
            ),
            //
            //Corpo da Página
            if (plano.toString().contains('Bronze')) PerfilBronze(),
            if (plano.toString().contains('Prata')) PerfilPrata(),
            if (plano.toString().contains('Ouro')) PerfilOuro(),
          ],
        ),
      ),
    );
  }

  void getdDados() {
    print('usuário ${widget.usuario}');
    var ref = FirebaseFirestore.instance
        .collection('Usuarios')
        .doc(widget.usuario.toString())
        .get();
    ref.then((value) {
      setState(() {
        plano = value['plano'];
        cpf = value['cpf'];
        telefone = value['telefone'];
        autorizado = value['autorizado'];
      });
      print(plano.toString());
    });
  }
}
