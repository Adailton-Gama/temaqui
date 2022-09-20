import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:temaqui/data/config.dart';
import 'package:temaqui/pages/AreaUsuario/chat/chat.dart';
import 'package:temaqui/pages/AreaUsuario/widgets/editPerfil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../home/Home_Screen.dart';
import '../../mainPage/Main_Page.dart';
import '../widgets/UserDrawerTile.dart';

class AreaProfissionais extends StatefulWidget {
  AreaProfissionais({Key? key, required this.uid}) : super(key: key);
  String uid;

  @override
  State<AreaProfissionais> createState() => _AreaProfissionaisState();
}

class _AreaProfissionaisState extends State<AreaProfissionais> {
  Timer? timer;
  void RefreshData() async {
    timer = new Timer.periodic(Duration(seconds: 5), (timer) {
      getdDados();
      print('atualizando');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    RefreshData();
    getdDados();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: primaryColor));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (timer != null) {
      timer!.cancel();
    }
    print('Atualização encerrada!');
    super.dispose();
  }

  @override
  //
  var nomeCompleto;
  var cpf;
  var telefone;
  var email;
  var categoria;
  var subcategoria;
  var autorizado;
  //
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _key,
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      gradient: appBarGradient,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      )),
                  padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 2,
                                  spreadRadius: 2,
                                )
                              ],
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      'https://cdn.discordapp.com/avatars/442050854581829656/b128666aa0305da5fbf31a4ed7d664dd.webp?size=128')),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    nomeCompleto.toString(),
                                    overflow: TextOverflow.visible,
                                    textAlign: TextAlign.start,
                                    softWrap: true,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    subcategoria.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EditPerfil(
                                    usuario: widget.uid,
                                  )));
                        },
                        child: Container(
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      stackOrder.clear();
                      stackOrder.add(HomeScreen());
                    });
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => InitScreen()),
                        (route) => false);
                  },
                  child: UserDrawerTile(
                    icon: Icons.home,
                    label: 'Início',
                  ),
                ),

                //Chat
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ChatScreen()));
                  },
                  child: UserDrawerTile(
                    icon: Icons.chat,
                    label: 'Mensagens',
                  ),
                ),
              ],
            ),

            //Sair da Conta
            GestureDetector(
              onTap: () {
                try {
                  FirebaseAuth.instance.signOut();
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.redAccent,
                      content: Text(
                        'Saindo da Conta...',
                        textAlign: TextAlign.center,
                      )));
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => InitScreen()),
                      (route) => false);
                } on FirebaseException catch (e) {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.redAccent,
                      content: Text(
                        'Erro ao tentar sair da conta.',
                        textAlign: TextAlign.center,
                      )));
                }
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 40),
                child: UserDrawerTile(
                  icon: Icons.logout,
                  label: 'Sair da Conta',
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                            _key.currentState!.openDrawer();
                          });
                        },
                        child: Ink(
                          height: 50,
                          width: 80,
                          child: Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        'BEM-VINDO!',
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
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: primaryColor,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                              ),
                              height: 50,
                              width: Get.size.width,
                            ),
                            SizedBox(height: 40),
                            Container(
                              margin: EdgeInsets.all(10),
                              height: 3,
                              width: Get.size.width - Get.size.width * .1,
                              // color: primaryColor,
                            ),
                            //
                            //NOME COMPLETO
                            Container(
                              width: Get.size.width,
                              margin: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Container(
                                    height: 30,
                                    margin: EdgeInsets.only(right: 10),
                                    child: Image.asset(
                                      'assets/NOME USUARIO.png',
                                      color: primaryColor,
                                      filterQuality: FilterQuality.medium,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Nome completo:',
                                        style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 4),
                                      ),
                                      Text(
                                        nomeCompleto.toString(),
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 2),
                                        color: primaryColor,
                                        height: 1.5,
                                        width: Get.size.width - 100,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            //
                            //DOCUMENTO DE IDENTIFICAÇÃO
                            Container(
                              width: Get.size.width,
                              margin: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Container(
                                    height: 30,
                                    margin: EdgeInsets.only(right: 10),
                                    child: Image.asset(
                                      'assets/IDENTIDADE.png',
                                      color: primaryColor,
                                      filterQuality: FilterQuality.medium,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Documento:',
                                        style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 4),
                                      ),
                                      Text(
                                        cpf.toString(),
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 2),
                                        color: primaryColor,
                                        height: 1.5,
                                        width: Get.size.width - 100,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            //
                            //TELEFONE
                            Container(
                              width: Get.size.width,
                              margin: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Container(
                                    height: 30,
                                    margin: EdgeInsets.only(right: 10),
                                    child: Image.asset(
                                      'assets/TELEFONE.png',
                                      color: primaryColor,
                                      filterQuality: FilterQuality.medium,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Telefone:',
                                        style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 4),
                                      ),
                                      Text(
                                        telefone.toString(),
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 2),
                                        color: primaryColor,
                                        height: 1.5,
                                        width: Get.size.width - 100,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            //
                            //E-MAIL
                            Container(
                              width: Get.size.width,
                              margin: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Container(
                                    height: 30,
                                    margin: EdgeInsets.only(right: 10),
                                    child: Image.asset(
                                      'assets/EMAIL.png',
                                      color: primaryColor,
                                      filterQuality: FilterQuality.medium,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'E-mail:',
                                        style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 4),
                                      ),
                                      Text(
                                        email.toString(),
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 2),
                                        color: primaryColor,
                                        height: 1.5,
                                        width: Get.size.width - 100,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => EditPerfil(
                                          usuario: widget.uid,
                                        )));
                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                                child: Material(
                                  elevation: 2,
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    width: Get.width,
                                    height: 40,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: secundaryColor,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.edit,
                                          color: primaryColor,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          'Editar Perfil',
                                          style: TextStyle(
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: primaryColor,
                                  blurRadius: 5,
                                  spreadRadius: 2,
                                )
                              ],
                              border: Border.all(
                                color: primaryColor,
                                width: 2,
                                style: BorderStyle.solid,
                              ),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://cdn.discordapp.com/avatars/442050854581829656/b128666aa0305da5fbf31a4ed7d664dd.webp?size=128')),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getdDados() {
    var ref = FirebaseFirestore.instance
        .collection('Usuarios')
        .doc(widget.uid.toString())
        .get();
    ref.then((value) {
      setState(() {
        nomeCompleto = value['nome'];
        cpf = value['cpf'];
        telefone = value['telefone'];
        email = value['email'];
        // endereco = value['endereco'];
        categoria = value['categoria'];
        subcategoria = value['subcategoria'];
        // plano = value['plano'];
        autorizado = value['autorizado'];
      });
    });
  }
}
