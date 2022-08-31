import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temaqui/data/config.dart';

class AreaCliente extends StatefulWidget {
  AreaCliente({Key? key, required this.username}) : super(key: key);
  String username;
  @override
  State<AreaCliente> createState() => _AreaClienteState();
}

class _AreaClienteState extends State<AreaCliente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Bem-Vindo! ${widget.username}'),
        backgroundColor: primaryColor,
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )),
              padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Abraão Lucas',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'Administrador | T.I. \n| Automação',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: Get.width,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.edit),
                        SizedBox(width: 10),
                        Text(
                          'Editar Perfil',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //Opções
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: Get.width,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'MENU',
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            //Inicio
            Container(
              margin: EdgeInsets.only(top: 5, left: 10, right: 10),
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: Get.width,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Inicio',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            //Encontrar Profissionais

            //Chat

            //Sair da Conta
          ],
        ),
      ),
    );
  }
}
