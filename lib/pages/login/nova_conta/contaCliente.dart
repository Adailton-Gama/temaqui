import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:temaqui/pages/login/nova_conta/selecionar_conta.dart';

import '../../../data/config.dart';
import '../../commons/Normal_Buttom.dart';
import '../../commons/TextForm.dart';
import '../../mainPage/Main_Page.dart';
import 'package:temaqui/data/config.dart' as config;

class CreateCliente extends StatefulWidget {
  CreateCliente({
    Key? key,
    this.isDraw = false,
    this.xOffset = 290,
    this.yOffset = 80,
  }) : super(key: key);
  bool isDraw;
  double xOffset;
  double yOffset;

  @override
  State<CreateCliente> createState() => _CreateClienteState();
}

class _CreateClienteState extends State<CreateCliente> {
  final CollectionReference refUser =
      FirebaseFirestore.instance.collection('Usuarios');
  //
  final MaskTextInputFormatter normal = MaskTextInputFormatter(mask: '');
  final MaskTextInputFormatter datemask =
      MaskTextInputFormatter(mask: "##/##/####");
  final MaskTextInputFormatter telmask =
      MaskTextInputFormatter(mask: '(##) #####-####');
  final MaskTextInputFormatter cpfmask =
      MaskTextInputFormatter(mask: '###.###.###-##');
  //
  //
  TextEditingController _nome = TextEditingController();
  TextEditingController _usuario = TextEditingController();
  TextEditingController _senha = TextEditingController();
  TextEditingController _telefone = TextEditingController();
  TextEditingController _cpf = TextEditingController();
  TextEditingController _endereco = TextEditingController();
  TextEditingController _dtnascimento = TextEditingController();

  String adminEmail = '';
  String adminPass = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Firebase.initializeApp();
    getEmailAdmin();
  }

  @override
  bool isDrawerOpen = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var heigthbar = AppBar().preferredSize.height;
    var padding = MediaQuery.of(context).padding;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: Get.size.height,
          child: Column(
            children: [
              //AppBar
              Container(
                height: 120,
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
                      //Linha 02
                      Container(
                        padding: EdgeInsets.only(left: 10, bottom: 20),
                        child: Row(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.center,
                                  width: Get.size.width - 10,
                                  padding: EdgeInsets.only(right: 10),
                                  child: Wrap(
                                    children: [
                                      Text(
                                        'Insira abaixo as informações necessárias para o cadastro!',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Arial',
                                          decoration: TextDecoration.none,
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 2),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Lottie.asset('lottie/clients.json',
                            animate: true, height: Get.size.height / 4),

                        //Título
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Criar',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 30,
                                fontFamily: 'Arial',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              'Conta',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 30,
                                fontFamily: 'Arial',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          height: 5,
                          width: 100,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        CustomTextForm(
                          padding: 5,
                          userControler: _nome,
                          label: 'Nome Completo',
                          mask: normal,
                          validacao: () {
                            if (_endereco.text == null ||
                                _endereco.text.isEmpty) {
                              return 'Favor Preencher Campo';
                            }
                          },
                        ),
                        CustomTextForm(
                          padding: 5,
                          userControler: _usuario,
                          label: 'E-mail',
                          mask: normal,
                          validacao: () {
                            if (_endereco.text == null ||
                                _endereco.text.isEmpty) {
                              return 'Favor Preencher Campo';
                            }
                          },
                        ),
                        CustomTextForm(
                          isObscure: false,
                          padding: 5,
                          userControler: _senha,
                          label: 'Senha',
                          mask: normal,
                          validacao: () {
                            if (_endereco.text == null ||
                                _endereco.text.isEmpty) {
                              return 'Favor Preencher Campo';
                            }
                          },
                        ),
                        CustomTextForm(
                          padding: 5,
                          userControler: _telefone,
                          label: 'Telefone',
                          mask: telmask,
                          type: TextInputType.numberWithOptions(),
                          validacao: () {
                            if (_endereco.text == null ||
                                _endereco.text.isEmpty) {
                              return 'Favor Preencher Campo';
                            }
                          },
                        ),
                        CustomTextForm(
                          padding: 5,
                          userControler: _cpf,
                          label: 'CPF',
                          mask: cpfmask,
                          type: TextInputType.numberWithOptions(),
                          validacao: () {
                            if (_endereco.text == null ||
                                _endereco.text.isEmpty) {
                              return 'Favor Preencher Campo';
                            }
                          },
                        ),
                        CustomTextForm(
                          padding: 5,
                          userControler: _endereco,
                          label: 'Endereço',
                          mask: normal,
                          validacao: () {
                            if (_endereco.text == null ||
                                _endereco.text.isEmpty) {
                              return 'Favor Preencher Campo';
                            }
                          },
                        ),
                        CustomTextForm(
                          padding: 5,
                          userControler: _dtnascimento,
                          label: 'Data de Nascimento',
                          mask: datemask,
                          type: TextInputType.numberWithOptions(),
                          acao: TextInputAction.done,
                          validacao: () {
                            if (_endereco.text == null ||
                                _endereco.text.isEmpty) {
                              return 'Favor Preencher Campo';
                            }
                          },
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Material(
                          elevation: 3,
                          borderRadius: BorderRadius.circular(20),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: () async {
                              if (FirebaseAuth.instance.currentUser?.uid ==
                                  null) {
                                try {
                                  if (_nome.text != null &&
                                      _usuario.text != null &&
                                      _senha.text != null &&
                                      _telefone.text != null &&
                                      _cpf.text != null &&
                                      _endereco.text != null &&
                                      _dtnascimento.text != null) {
                                    await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                      email: _usuario.text,
                                      password: _senha.text,
                                    );
                                    var uid =
                                        FirebaseAuth.instance.currentUser?.uid;
                                    FirebaseFirestore.instance
                                        .collection('Usuarios')
                                        .doc(uid.toString())
                                        .set({
                                      'uid': uid.toString(),
                                      'nome': _nome.text,
                                      'email': _usuario.text,
                                      'senha': _senha.text,
                                      'telefone': _telefone.text,
                                      'cpf': _cpf.text,
                                      'endereco': _endereco.text,
                                      'nascimento': _dtnascimento.text,
                                      'nivel': 'cliente',
                                      'time': Timestamp.now(),
                                    });
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            backgroundColor: Colors.green,
                                            content: Text(
                                                'Usuário: ${_nome.text} cadastrado com sucesso!')));
                                    setState(() {
                                      _nome.clear();
                                      _usuario.clear();
                                      _senha.clear();
                                      _telefone.clear();
                                      _cpf.clear();
                                      _endereco.clear();
                                      _dtnascimento.clear();
                                    });
                                  }
                                } on FirebaseException catch (e) {
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          backgroundColor: Colors.red,
                                          content: Text(
                                            'Error ao se cadastrar\nVerifique se todos os campos estão preenchidos!',
                                            style:
                                                TextStyle(color: Colors.white),
                                            textAlign: TextAlign.center,
                                          )));
                                }
                              } else {
                                await FirebaseAuth.instance.signOut();
                                try {
                                  if (_nome.text != null &&
                                      _usuario.text != null &&
                                      _senha.text != null &&
                                      _telefone.text != null &&
                                      _cpf.text != null &&
                                      _endereco.text != null &&
                                      _dtnascimento.text != null) {
                                    FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                      email: _usuario.text,
                                      password: _senha.text,
                                    );
                                    await Future.delayed(Duration(seconds: 3));
                                    print(
                                        'ID CADASTRADO: ${FirebaseAuth.instance.currentUser?.uid}');
                                    FirebaseFirestore.instance
                                        .collection('Usuarios')
                                        .doc(FirebaseAuth
                                            .instance.currentUser?.uid
                                            .toString())
                                        .set({
                                      'nome': _nome.text,
                                      'email': _usuario.text,
                                      'senha': _senha.text,
                                      'telefone': _telefone.text,
                                      'cpf': _cpf.text,
                                      'endereco': _endereco.text,
                                      'nascimento': _dtnascimento.text,
                                      'nivel': 'cliente',
                                      'time': Timestamp.now(),
                                    });
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            backgroundColor: Colors.green,
                                            content: Text(
                                                'Usuário: ${_nome.text} cadastrado com sucesso!')));
                                    setState(() {
                                      _nome.clear();
                                      _usuario.clear();
                                      _senha.clear();
                                      _telefone.clear();
                                      _cpf.clear();
                                      _endereco.clear();
                                      _dtnascimento.clear();
                                    });
                                    Future.delayed(Duration(seconds: 1))
                                        .then((value) {
                                      FirebaseAuth.instance.signOut();
                                      FirebaseAuth.instance
                                          .signInWithEmailAndPassword(
                                              email: adminEmail,
                                              password: adminPass);
                                    });
                                  }
                                } on FirebaseException catch (e) {
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          backgroundColor: Colors.red,
                                          content: Text(
                                            'Error ao se cadastrar\nVerifique se todos os campos estão preenchidos!',
                                            style:
                                                TextStyle(color: Colors.white),
                                            textAlign: TextAlign.center,
                                          )));
                                }
                              }
                            },
                            child: Ink(
                              child: NormalButtom(
                                  color: secundaryColor,
                                  labelColor: Colors.white,
                                  label: 'Criar Conta',
                                  width: Get.size.width),
                            ),
                          ),
                        ),
                      ],
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

  void getEmailAdmin() async {
    var mail = await refUser
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get()
        .then((value) {
      var data = value.data() as Map<String, dynamic>;
      adminEmail = data['email'];
      adminPass = data['senha'];
      print(adminEmail + ' | ' + adminPass);
    });
  }
}
