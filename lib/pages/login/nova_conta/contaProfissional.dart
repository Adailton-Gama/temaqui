import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:temaqui/pages/login/nova_conta/selecionar_conta.dart';
import 'package:temaqui/pages/mainPage/Main_Page.dart';

import '../../../data/config.dart';
import '../../commons/Normal_Buttom.dart';
import '../../commons/TextForm.dart';
import '../../commons/cardAccount.dart';

class CreateProfessional extends StatefulWidget {
  CreateProfessional({
    Key? key,
    this.isDraw = false,
    this.xOffset = 290,
    this.yOffset = 80,
  }) : super(key: key);
  bool isDraw;
  double xOffset;
  double yOffset;
  @override
  State<CreateProfessional> createState() => _CreateProfessionalState();
}

class _CreateProfessionalState extends State<CreateProfessional> {
  TextEditingController _nome = TextEditingController();
  TextEditingController _usuario = TextEditingController();
  TextEditingController _senha = TextEditingController();
  TextEditingController _telefone = TextEditingController();
  TextEditingController _cpf = TextEditingController();
  TextEditingController _endereco = TextEditingController();
  TextEditingController _profissao = TextEditingController();
  String selectedPlano = 'Bronze';
  List planos = ['Bronze', 'Prata', 'Ouro'];

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
                              Lottie.asset('lottie/workers.json',
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
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  'Para Acesso ao App:',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              CustomTextForm(
                                  padding: 10,
                                  userControler: _usuario,
                                  label: 'Usuário'),
                              CustomTextForm(
                                  padding: 10,
                                  userControler: _senha,
                                  label: 'Senha'),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  'Dados Pessoais:',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              CustomTextForm(
                                  padding: 10,
                                  userControler: _nome,
                                  label: 'Nome Completo'),
                              CustomTextForm(
                                  padding: 10,
                                  userControler: _telefone,
                                  label: 'Telefone'),
                              CustomTextForm(
                                  padding: 10,
                                  userControler: _cpf,
                                  label: 'CPF'),
                              CustomTextForm(
                                  padding: 10,
                                  userControler: _endereco,
                                  label: 'Endereço'),
                              CustomTextForm(
                                  padding: 10,
                                  userControler: _profissao,
                                  label: 'Profissão'),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    alignment: Alignment.topLeft,
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Planos:',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: primaryColor,
                                            width: 2,
                                            style: BorderStyle.solid)),
                                    child: DropdownButton(
                                      borderRadius: BorderRadius.circular(20),
                                      dropdownColor: secundaryColor,
                                      icon: Icon(
                                        Icons.list,
                                        color: primaryColor,
                                      ),
                                      style: TextStyle(
                                          color: primaryColor, fontSize: 16),
                                      isExpanded: true,
                                      underline: Container(
                                        color: Colors.transparent,
                                      ),
                                      elevation: 0,
                                      value: selectedPlano,
                                      items: planos
                                          .map((item) =>
                                              DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(item)))
                                          .toList(),
                                      onChanged: (String? item) {
                                        setState(() {
                                          selectedPlano = item!;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Material(
                                    child: InkWell(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                  content: Text(
                                                      'Create Profissional Account'),
                                                ));
                                      },
                                      child: Ink(
                                        child: NormalButtom(
                                            color: primaryColor,
                                            label: 'Criar Conta',
                                            width: Get.size.width / 2.5),
                                      ),
                                    ),
                                  ),
                                ],
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
