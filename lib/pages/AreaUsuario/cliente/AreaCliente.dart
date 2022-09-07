import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temaqui/data/config.dart';
import 'package:temaqui/pages/home/Home_Screen.dart';
import 'package:temaqui/pages/mainPage/Main_Page.dart';

import '../../prestadores/Work_Page.dart';
import '../chat/chat.dart';
import '../widgets/UserDrawerTile.dart';
import '../widgets/editPerfil.dart';

class AreaCliente extends StatefulWidget {
  AreaCliente({
    Key? key,
  }) : super(key: key);
  @override
  State<AreaCliente> createState() => _AreaClienteState();
}

class _AreaClienteState extends State<AreaCliente> {
  @override
  Widget build(BuildContext context) {
    //
    var nomeCompleto = 'nomeCompleto';
    var telefone = 'telefone';
    var datadeNascimento = 'datadeNascimento';
    var cpf = 'cpf';
    var endereco = 'endereco';
    //
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Bem-Vindo!'),
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
                //Encontrar Profissionais
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
                    icon: Icons.work,
                    label: 'Encontrar Profissionais',
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 150,
                  height: 150,
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://cdn.discordapp.com/avatars/442050854581829656/b128666aa0305da5fbf31a4ed7d664dd.webp?size=128')),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              Text(
                'Nome Completo:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('${nomeCompleto}'),
              Text(
                '\nData de Nascimento:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('${datadeNascimento}'),
              Text(
                '\nTelefone:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('${telefone}'),
              Text(
                '\nCPF:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('${cpf}'),
              Text(
                '\nEndereço:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('${endereco}'),
              //
              //
              //
              SizedBox(height: 20),
              Text(
                '\nTraga seus serviços para nosso App!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => EditPerfil()));
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: Get.width,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: secundaryColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
        ),
      ),
    );
  }
}
