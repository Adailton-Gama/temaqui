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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Firebase.initializeApp();
  }

  @override
  bool isDrawerOpen = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var heigthbar = AppBar().preferredSize.height;
    var padding = MediaQuery.of(context).padding;
    return SafeArea(
      child: AnimatedContainer(
        height: Get.size.height,
        width: Get.size.width,
        transform: Matrix4.translationValues(widget.xOffset, widget.yOffset, 0)
          ..scale(widget.isDraw ? 0.85 : 1.00)
          ..rotateZ(widget.isDraw ? -50 : 0),
        duration: Duration(milliseconds: 500),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: widget.isDraw
              ? BorderRadius.circular(20)
              : BorderRadius.circular(0),
          boxShadow: [
            widget.isDraw
                ? BoxShadow(color: Colors.grey, blurRadius: 5, spreadRadius: 2)
                : BoxShadow()
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
                child: Container(
              height: Get.size.height,
              child: Column(
                children: [
                  //AppBar
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: widget.isDraw
                          ? BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(50),
                            )
                          : BorderRadius.only(
                              bottomRight: Radius.circular(50),
                            ),
                    ),
                    //AppBar
                    child: Container(
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: widget.isDraw
                            ? BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(100),
                              )
                            : BorderRadius.only(
                                bottomRight: Radius.circular(100),
                              ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Linha 01
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                widget.isDraw
                                    ? InkWell(
                                        onTap: () {
                                          setState(() {
                                            widget.xOffset = 0;
                                            widget.yOffset = 0;
                                            widget.isDraw = false;
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
                                      )
                                    : InkWell(
                                        onTap: () {
                                          setState(() {
                                            widget.xOffset = Get.size.width -
                                                Get.size.width * 0.1;
                                            widget.yOffset = 80;
                                            widget.isDraw = true;
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
                    //Add um IgnoredPoint para bloquear o uso da Lista ao acessar o menu
                    child: IgnorePointer(
                      ignoring: widget.isDraw ? true : false,
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Container(
                          padding:
                              EdgeInsets.only(left: 20, right: 20, bottom: 30),
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
                                margin: EdgeInsets.all(10),
                                height: 5,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              CustomTextForm(
                                padding: 10,
                                userControler: _nome,
                                label: 'Nome Completo',
                                mask: normal,
                              ),
                              CustomTextForm(
                                padding: 10,
                                userControler: _usuario,
                                label: 'E-mail',
                                mask: normal,
                              ),
                              CustomTextForm(
                                isObscure: false,
                                padding: 10,
                                userControler: _senha,
                                label: 'Senha',
                                mask: normal,
                              ),
                              CustomTextForm(
                                padding: 10,
                                userControler: _telefone,
                                label: 'Telefone',
                                mask: telmask,
                                type: TextInputType.numberWithOptions(),
                              ),
                              CustomTextForm(
                                padding: 10,
                                userControler: _cpf,
                                label: 'CPF',
                                mask: cpfmask,
                                type: TextInputType.numberWithOptions(),
                              ),
                              CustomTextForm(
                                padding: 10,
                                userControler: _endereco,
                                label: 'Endereço',
                                mask: normal,
                              ),
                              CustomTextForm(
                                padding: 10,
                                userControler: _dtnascimento,
                                label: 'Data de Nascimento',
                                mask: datemask,
                                type: TextInputType.numberWithOptions(),
                                acao: TextInputAction.done,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                elevation: 3,
                                borderRadius: BorderRadius.circular(20),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(20),
                                  onTap: () async {
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
                                        var uid = FirebaseAuth
                                            .instance.currentUser?.uid;
                                        FirebaseFirestore.instance
                                            .collection('Usuarios')
                                            .doc(uid.toString())
                                            .set({
                                          'nome': _nome.text,
                                          'email': _usuario.text,
                                          'senha': _senha.text,
                                          'telefone': _telefone.text,
                                          'cpf': _cpf.text,
                                          'endereco': _endereco.text,
                                          'nascimento': _dtnascimento.text,
                                          'nivel': 'cliente',
                                        });
                                        ScaffoldMessenger.of(context)
                                            .clearSnackBars();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
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
                                                style: TextStyle(
                                                    color: Colors.white),
                                                textAlign: TextAlign.center,
                                              )));
                                    }
                                  },
                                  child: Ink(
                                    child: NormalButtom(
                                        color: secundaryColor,
                                        labelColor: primaryColor,
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
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
