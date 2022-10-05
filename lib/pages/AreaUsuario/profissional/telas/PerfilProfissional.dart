import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temaqui/data/config.dart';

class PerfilProfissional extends StatefulWidget {
  var usuario;
  PerfilProfissional({Key? key, required this.usuario}) : super(key: key);

  @override
  State<PerfilProfissional> createState() => _PerfilProfissionalState();
}

class _PerfilProfissionalState extends State<PerfilProfissional> {
  @override
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
            Expanded(
              child: Container(
                height: 10,
                width: Get.size.width,
                color: Colors.white,
                child: Column(
                  children: [
                    //
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
