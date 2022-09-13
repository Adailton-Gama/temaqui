import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temaqui/pages/login/nova_conta/contaAdmin.dart';

import '../../../../data/config.dart';
import '../../../commons/cardAccount.dart';
import '../../../login/nova_conta/contaCliente.dart';
import '../../../login/nova_conta/contaProfissional.dart';

class NewAccounts extends StatefulWidget {
  const NewAccounts({Key? key}) : super(key: key);

  @override
  State<NewAccounts> createState() => NewntsState();
}

class NewntsState extends State<NewAccounts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: Get.size.height,
          child: Column(
            children: [
              //AppBar
              Container(
                height: 70,
                decoration: BoxDecoration(
                  gradient: appBarGradient,
                ),
                //AppBar
                child: Container(
                  decoration: BoxDecoration(
                    gradient: appBarGradient,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Linha 01
                      Container(
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
                              'Cadastrar Novas Contas',
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
                    ],
                  ),
                ),
              ),

              //Corpo da Página

              Expanded(
                //Add um IgnoredPoint para bloquear o uso da Lista ao acessar o menu
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        child: Text(
                          'Escolha o tipo de conta:',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Arial',
                            decoration: TextDecoration.none,
                            color: primaryColor,
                            fontSize: 25,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      //Card Profissional
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CreateProfessional()));
                          });
                        },
                        child: CardAccount(
                          animation: 'lottie/workers.json',
                          nivel: 'Profissional',
                          descricao:
                              'Cadastrar um profissional para que ele possa estar ofertando seus serviços.',
                        ),
                      ),

                      //Card Cliente
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CreateCliente()));
                          });
                        },
                        child: CardAccount(
                          animation: 'lottie/clients.json',
                          nivel: 'Cliente',
                          descricao:
                              'Cadastrar um cliente para que o mesmo possa começar a usar o App e a contratar!',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ContaAdmin()));
                          });
                        },
                        child: CardAccount(
                          animation: 'lottie/admin.json',
                          nivel: 'Administrador',
                          descricao:
                              'Cadastrar um administrador para gerenciar o App.',
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
    );
  }
}
