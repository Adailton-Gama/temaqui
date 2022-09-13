import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:temaqui/data/data.dart';
import 'package:temaqui/pages/commons/Border_Buttom.dart';
import 'package:temaqui/pages/login/nova_conta/commons/escolherCategoria.dart';
import 'package:temaqui/pages/login/nova_conta/selecionar_conta.dart';
import 'package:temaqui/pages/mainPage/Main_Page.dart';
import '../../../data/config.dart';
import '../../../data/config.dart' as config;
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
  //
  //
  final MaskTextInputFormatter normal = MaskTextInputFormatter(mask: '');
  final MaskTextInputFormatter cpfmask =
      MaskTextInputFormatter(mask: '###.###.###-##');
  final MaskTextInputFormatter datemask =
      MaskTextInputFormatter(mask: "##/##/####");
  final MaskTextInputFormatter telmask =
      MaskTextInputFormatter(mask: '(##) # ####-####');

  //
  //
  TextEditingController _nome = TextEditingController();
  TextEditingController _usuario = TextEditingController();
  TextEditingController _senha = TextEditingController();
  TextEditingController _telefone = TextEditingController();
  TextEditingController _cpf = TextEditingController();
  TextEditingController _endereco = TextEditingController();
  TextEditingController _profissao = TextEditingController();
  TextEditingController _dtnascimento = TextEditingController();

  //
  //
  String selectedPlano =
      '${config.bronze.nome}    -    R\$ ${config.bronze.preco.toStringAsFixed(2)}';
  List<Planos> planos = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    planos.add(config.bronze);
    planos.add(config.prata);
    planos.add(config.ouro);
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
              //Add um IgnoredPoint para bloquear o uso da Lista ao acessar o menu
              child: IgnorePointer(
                ignoring: widget.isDraw ? true : false,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 30),
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
                          margin: EdgeInsets.all(5),
                          height: 5,
                          width: 100,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
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
                          padding: 5,
                          userControler: _usuario,
                          label: 'E-mail',
                          mask: normal,
                        ),
                        CustomTextForm(
                          padding: 5,
                          userControler: _senha,
                          label: 'Senha',
                          mask: normal,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
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
                          padding: 5,
                          userControler: _nome,
                          label: 'Nome Completo',
                          mask: normal,
                        ),
                        CustomTextForm(
                          padding: 5,
                          userControler: _telefone,
                          label: 'Telefone',
                          mask: telmask,
                          type: TextInputType.numberWithOptions(),
                        ),
                        CustomTextForm(
                          padding: 5,
                          userControler: _cpf,
                          label: 'CPF',
                          mask: cpfmask,
                          type: TextInputType.numberWithOptions(),
                        ),
                        CustomTextForm(
                          padding: 5,
                          userControler: _dtnascimento,
                          label: 'Data de Nascimento',
                          mask: datemask,
                          type: TextInputType.numberWithOptions(),
                          acao: TextInputAction.next,
                        ),
                        CustomTextForm(
                          padding: 5,
                          userControler: _endereco,
                          label: 'Endereço',
                          mask: normal,
                        ),
                        //
                        //Profissão
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                'Dados da Profissão:',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            content: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                //
                                                Text(
                                                  'Escolha o plano desejado:',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                //
                                                Container(
                                                  padding:
                                                      EdgeInsets.only(top: 10),
                                                  height: Get.size.height / 2.3,
                                                  child: ListView.builder(
                                                      itemCount: planos.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              selectedPlano =
                                                                  '${planos[index].nome}    -    R\$ ${planos[index].preco.toStringAsFixed(2)}';
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            });
                                                          },
                                                          child:
                                                              EscolherCategoria(
                                                            nome: planos[index]
                                                                .nome,
                                                            descricao:
                                                                planos[index]
                                                                    .descricao,
                                                            preco: planos[index]
                                                                .preco,
                                                          ),
                                                        );
                                                      }),
                                                ),
                                              ],
                                            ),
                                          ));
                                },
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.all(5),
                                  height: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: primaryColor, width: 2),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        selectedPlano,
                                        style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Icon(
                                        Icons.menu,
                                        color: primaryColor,
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                        //
                        //Planos

                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 5),
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
                            GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            content: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                //
                                                Text(
                                                  'Escolha o plano desejado:',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                //
                                                Container(
                                                  padding:
                                                      EdgeInsets.only(top: 5),
                                                  height: Get.size.height / 2.3,
                                                  child: ListView.builder(
                                                      itemCount: planos.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              selectedPlano =
                                                                  '${planos[index].nome}    -    R\$ ${planos[index].preco.toStringAsFixed(2)}';
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            });
                                                          },
                                                          child:
                                                              EscolherCategoria(
                                                            nome: planos[index]
                                                                .nome,
                                                            descricao:
                                                                planos[index]
                                                                    .descricao,
                                                            preco: planos[index]
                                                                .preco,
                                                          ),
                                                        );
                                                      }),
                                                ),
                                              ],
                                            ),
                                          ));
                                },
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.all(5),
                                  height: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: primaryColor, width: 2),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        selectedPlano,
                                        style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Icon(
                                        Icons.menu,
                                        color: primaryColor,
                                      ),
                                    ],
                                  ),
                                )),
                          ],
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
                                    'nome': _nome.text,
                                    'email': _usuario.text,
                                    'senha': _senha.text,
                                    'telefone': _telefone.text,
                                    'cpf': _cpf.text,
                                    'endereco': _endereco.text,
                                    'nascimento': _dtnascimento.text,
                                    'nivel': 'profissional',
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
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Text(
                                          'Error ao se cadastrar\nVerifique se todos os campos estão preenchidos!',
                                          style: TextStyle(color: Colors.white),
                                          textAlign: TextAlign.center,
                                        )));
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
            ),
          ],
        ),
      )),
    );
  }
}
