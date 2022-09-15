import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:temaqui/pages/AreaUsuario/admin/funcionalidades/Contas.dart';
import 'package:temaqui/pages/AreaUsuario/admin/funcionalidades/planos.dart';

import '../../../data/config.dart';
import '../../home/Home_Screen.dart';
import '../../mainPage/Main_Page.dart';
import '../../prestadores/Work_Page.dart';
import '../chat/chat.dart';
import '../widgets/UserDrawerTile.dart';
import '../widgets/editPerfil.dart';
import 'funcionalidades/Categorias.dart';

class AdminPage extends StatefulWidget {
  AdminPage({Key? key, required this.uid}) : super(key: key);
  var uid;

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  void initState() {
    // TODO: implement initState
    getDados();
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: primaryColor));
  }

  @override
  String nomeCompleto = '';
  String cpf = '';
  String telefone = '';
  String endereco = '';
  String datadeNascimento = '';
  String email = '';
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _key,
      drawer: new Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                      gradient: appBarGradient,
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
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 2,
                                  spreadRadius: 2,
                                )
                              ],
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://cdn.discordapp.com/avatars/442050854581829656/b128666aa0305da5fbf31a4ed7d664dd.webp?size=128')),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            width: Get.size.width * .55,
                            child: Text(
                              nomeCompleto.toString(),
                              softWrap: true,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
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
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: Get.width,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.only(right: 5),
                        color: primaryColor,
                        width: 2,
                        height: 2,
                      )),
                      Text(
                        'MENU',
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.only(left: 5),
                        color: primaryColor,
                        width: 2,
                        height: 2,
                      )),
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
                //Cadastrar Categorias
                GestureDetector(
                  onTap: () {
                    Future.delayed(Duration(milliseconds: 100)).then((value) {
                      setState(() {
                        stackOrder.clear();
                        stackOrder.add(WorkPage(
                          xOffset: 0,
                          yOffset: 0,
                          isDraw: false,
                        ));
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CadCategorias()));
                      });
                    });
                  },
                  child: UserDrawerTile(
                    icon: Icons.work,
                    label: 'Cadastrar Categorias',
                  ),
                ),
                //Criar Contas
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => NewAccounts()));
                  },
                  child: UserDrawerTile(
                    icon: Icons.people,
                    label: 'Adicionar Contas',
                  ),
                ),
                //Adicionar Dicas e Artigos
                GestureDetector(
                  onTap: () {
                    Future.delayed(Duration(milliseconds: 100)).then((value) {
                      setState(() {
                        stackOrder.clear();
                        stackOrder.add(WorkPage(
                          xOffset: 0,
                          yOffset: 0,
                          isDraw: false,
                        ));
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => InitScreen()));
                      });
                    });
                  },
                  child: UserDrawerTile(
                    icon: Icons.tips_and_updates,
                    label: 'Dicas e Artigos',
                  ),
                ),
                //Adicionar Planos
                GestureDetector(
                  onTap: () {
                    Future.delayed(Duration(milliseconds: 100)).then((value) {
                      setState(() {
                        stackOrder.clear();
                        stackOrder.add(WorkPage(
                          xOffset: 0,
                          yOffset: 0,
                          isDraw: false,
                        ));
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CadPlanos()));
                      });
                    });
                  },
                  child: UserDrawerTile(
                    icon: Icons.attach_money,
                    label: 'Planos',
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
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
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
                                    gradient: appBarGradient,
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
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
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
                                            Expanded(child: Text('')),
                                            Icon(
                                              Icons.edit,
                                              color: primaryColor,
                                            ),
                                            SizedBox(width: 2),
                                            Text(
                                              'Editar Perfil',
                                              style: TextStyle(
                                                color: primaryColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            ),
                                            SizedBox(width: 30),
                                            Expanded(child: Text('')),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getDados() {
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
        endereco = value['endereco'];
        datadeNascimento = value['nascimento'];
      });
    });
  }
}
