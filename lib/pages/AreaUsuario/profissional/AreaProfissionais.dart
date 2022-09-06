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
  AreaProfissionais({
    Key? key,
    // required this.username,
  }) : super(key: key);
  //String username;

  @override
  State<AreaProfissionais> createState() => _AreaProfissionaisState();
}

class _AreaProfissionaisState extends State<AreaProfissionais> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: primaryColor));
  }

  @override
  Widget build(BuildContext context) {
    //
    var nomeCompleto = 'nomeCompleto';
    var telefone = 'telefone';
    var datadeNascimento = 'datadeNascimento';
    var cpf = 'cpf';
    var endereco = 'endereco';
    var categoria = 'categoria';
    var profissao = 'profissao';
    var plano = 'plano';
    var autorizado = 'autorizado';
    //
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Meus Dados'),
        backgroundColor: primaryColor,
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://cdn.discordapp.com/avatars/442050854581829656/b128666aa0305da5fbf31a4ed7d664dd.webp?size=128')),
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
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EditPerfil()));
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
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.only(bottom: 20),
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
                                  filterQuality: FilterQuality.medium,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    'Abraão Lucas do Carmo',
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
                                  filterQuality: FilterQuality.medium,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    '000.000.000-00',
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
                                  filterQuality: FilterQuality.medium,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    '(74)9 9999-9999',
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
                                  filterQuality: FilterQuality.medium,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    'abraao@gmail.com',
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
                                builder: (context) => EditPerfil()));
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            width: Get.width,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Editar Perfil',
                                  style: TextStyle(
                                    color: Colors.white,
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
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
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
      ),
    );
  }
}
