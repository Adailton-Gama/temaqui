import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:temaqui/pages/planos/planos.dart';
import 'package:temaqui/pages/quemSomos/quemSomos.dart';

import '../../data/config.dart';
import '../AreaUsuario/admin/adminPage.dart';
import '../AreaUsuario/cliente/AreaCliente.dart';
import '../AreaUsuario/profissional/AreaProfissionais.dart';
import '../FaleConosco/faleConosco.dart';
import '../commons/menu_item.dart';
import '../commons/styles.dart';
import '../home/Home_Screen.dart';
import '../login/login_page.dart';
import '../prestadores/Work_Page.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  double xOffset = 0;
  double yOffset = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: SingleChildScrollView(
          reverse: true,
          child: Container(
            width: Get.size.width,
            height: Get.size.height,
            child: Stack(
              children: [
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 50,
                      left: 10,
                      bottom: 70,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        //Logo ou Foto do Usuário
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                gradient: appBarGradient,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: Image.asset(
                                  'assets/logo_white.png',
                                  filterQuality: FilterQuality.medium,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            // Column(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: <Widget>[
                            //     Text.rich(
                            //       TextSpan(
                            //         children: [
                            //           TextSpan(
                            //             text: 'Tem\n'.toUpperCase(),
                            //             style: TextStyle(
                            //               color: textMenuColor,
                            //               fontSize: 30,
                            //               fontWeight: FontWeight.bold,
                            //             ),
                            //           ),
                            //           TextSpan(
                            //             text: 'Aqui'.toUpperCase(),
                            //             style: TextStyle(
                            //               color:
                            //                   Color.fromRGBO(242, 199, 22, 1),
                            //               fontSize: 30,
                            //               fontWeight: FontWeight.bold,
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),

                        //Itens da Paginação:
                        Column(
                          children: <Widget>[
                            //Item da Paginação
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  stackOrder.clear();
                                  stackOrder.add(HomeScreen(
                                    xOffset: 300,
                                    yOffset: 80,
                                    isDraw: true,
                                  ));
                                  Future.delayed(Duration(milliseconds: 100))
                                      .then((value) {
                                    setState(() {
                                      stackOrder.clear();
                                      stackOrder.add(HomeScreen(
                                        isDraw: false,
                                      ));
                                    });
                                  });
                                  print('Inicio');
                                });
                              },
                              child: MenuItemPage(
                                icon: Icons.home,
                                label: 'Início',
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                try {
                                  if (FirebaseAuth.instance.currentUser?.uid !=
                                      null) {
                                    var uid =
                                        FirebaseAuth.instance.currentUser!.uid;
                                    FirebaseFirestore.instance
                                        .collection('Usuarios')
                                        .doc(uid)
                                        .get()
                                        .then((value) {
                                      String nivel = value['nivel'].toString();
                                      if (nivel == 'cliente') {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AreaCliente(
                                                        uid: uid.toString())));
                                      } else if (nivel == 'profissional') {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AreaProfissionais(
                                                        uid: uid.toString())));
                                      } else if (nivel == 'admin') {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) => AdminPage(
                                                    uid: uid.toString())));
                                      }
                                    });
                                  } else {
                                    setState(() {
                                      stackOrder.clear();
                                      stackOrder.add(LoginPage(
                                        xOffset: 300,
                                        yOffset: 80,
                                        isDraw: true,
                                      ));
                                      Future.delayed(
                                              Duration(milliseconds: 100))
                                          .then((value) {
                                        setState(() {
                                          stackOrder.clear();
                                          stackOrder.add(LoginPage(
                                            xOffset: 0,
                                            yOffset: 0,
                                            isDraw: false,
                                          ));
                                        });
                                      });
                                    });
                                  }
                                } on FirebaseException catch (e) {
                                  print(e.message);
                                }
                              },
                              child: MenuItemPage(
                                icon: Icons.person_sharp,
                                label: 'Área do Usuário',
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  stackOrder.clear();
                                  stackOrder.add(WorkPage(
                                    xOffset: 300,
                                    yOffset: 80,
                                    isDraw: true,
                                  ));
                                });
                                Future.delayed(Duration(milliseconds: 100))
                                    .then((value) {
                                  setState(() {
                                    stackOrder.clear();
                                    stackOrder.add(WorkPage(
                                      xOffset: 0,
                                      yOffset: 0,
                                      isDraw: false,
                                    ));
                                  });
                                });
                              },
                              child: MenuItemPage(
                                icon: Icons.person_search,
                                label: 'Prestadores',
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                stackOrder.clear();
                                setState(() {
                                  stackOrder.add(NossosPlanos(isDraw: true));
                                });
                                Future.delayed(Duration(milliseconds: 100))
                                    .then((value) {
                                  setState(() {
                                    stackOrder.clear();
                                    stackOrder.add(NossosPlanos(
                                      isDraw: false,
                                      xOffset: 0,
                                      yOffset: 0,
                                    ));
                                  });
                                });
                              },
                              child: MenuItemPage(
                                icon: Icons.currency_exchange,
                                label: 'Planos',
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                stackOrder.clear();
                                setState(() {
                                  stackOrder.add(FaleConosco(isDraw: true));
                                });
                                Future.delayed(Duration(milliseconds: 100))
                                    .then((value) {
                                  stackOrder.clear();
                                  setState(() {
                                    stackOrder.add(FaleConosco(
                                      isDraw: false,
                                      xOffset: 0,
                                      yOffset: 0,
                                    ));
                                  });
                                });
                              },
                              child: MenuItemPage(
                                icon: Icons.chat,
                                label: 'Fale Conosco',
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                stackOrder.clear();
                                setState(() {
                                  stackOrder.add(QuemSomos(
                                    isDraw: true,
                                  ));
                                  Future.delayed(Duration(milliseconds: 100))
                                      .then((value) {
                                    setState(() {
                                      stackOrder.clear();
                                      stackOrder.add(QuemSomos(
                                        isDraw: false,
                                        xOffset: 0,
                                        yOffset: 0,
                                      ));
                                    });
                                  });
                                });
                              },
                              child: MenuItemPage(
                                icon: Icons.info,
                                label: 'Quem Somos',
                              ),
                            ),
                          ],
                        ),

                        //Logout
                        Text(''),
                        Text(''),
                        Text(''),
                      ],
                    ),
                  ),
                ),
                stackOrder[0],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
