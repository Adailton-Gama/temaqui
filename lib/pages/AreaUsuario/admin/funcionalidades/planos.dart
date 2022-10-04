import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:temaqui/pages/AreaUsuario/admin/funcionalidades/showplanos.dart';
import 'package:temaqui/pages/commons/Normal_Buttom.dart';
import 'package:temaqui/pages/planos/planos.dart';

import '../../../../data/config.dart';
import '../../../commons/TextForm.dart';

class CadPlanos extends StatefulWidget {
  const CadPlanos({Key? key}) : super(key: key);

  @override
  State<CadPlanos> createState() => _CadPlanosState();
}

class _CadPlanosState extends State<CadPlanos> {
  final MaskTextInputFormatter normal = MaskTextInputFormatter(mask: '');
  TextEditingController _nome = TextEditingController();
  TextEditingController _valor = TextEditingController();
  TextEditingController _beneficio = TextEditingController();

  List beneficios = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            height: Get.size.height,
            width: Get.size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //AppBar
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  width: Get.size.width,
                  decoration: BoxDecoration(gradient: appBarGradient),
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
                        'Gerenciar Planos',
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
                //
                //
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ShowPlanos()));
                            },
                            child: Container(
                              padding: EdgeInsets.all(5),
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Ver planos cadastrados'.toUpperCase(),
                                style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        color: primaryColor,
                                        blurRadius: 5,
                                        offset: Offset.zero,
                                      )
                                    ]),
                              ),
                            ),
                          ),
                          Text(
                            'Nome:',
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          CustomTextForm(
                            padding: 0,
                            userControler: _nome,
                            label: 'Nome do Plano',
                            mask: normal,
                            validacao: () {},
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Valor:',
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          CustomTextForm(
                            padding: 0,
                            userControler: _valor,
                            label: 'Valor do Plano',
                            mask: normal,
                            validacao: () {},
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15, bottom: 10),
                            height: 1,
                            width: Get.size.width,
                            color: primaryColor,
                          ),
                          Text(
                            'Benefícios:',
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          //Beneficios

                          Row(
                            children: [
                              Expanded(
                                child: CustomTextForm(
                                  padding: 0,
                                  userControler: _beneficio,
                                  label: 'Beneficio',
                                  mask: normal,
                                  validacao: () {},
                                ),
                              ),
                              SizedBox(width: 5),
                              ElevatedButton(
                                onPressed: () {
                                  if (_beneficio.text.isNotEmpty) {
                                    setState(() {
                                      beneficios.add(_beneficio.text);
                                      _beneficio.clear();
                                    });
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                            backgroundColor: Colors.red,
                                            content: Text(
                                              'Campo Beneficio Vazio!',
                                              textAlign: TextAlign.center,
                                            )));
                                  }
                                  FocusManager.instance.primaryFocus!.unfocus();
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                child: Text(
                                  '+',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          //Lista de Benefícios
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 200,
                            width: Get.size.width,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: primaryColor,
                                    width: 2,
                                    style: BorderStyle.solid)),
                            child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                itemCount: beneficios.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: EdgeInsets.all(5),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 10,
                                          width: 10,
                                          margin: EdgeInsets.only(right: 10),
                                          decoration: BoxDecoration(
                                              color: secundaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(100)),
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: Text(
                                              beneficios[index],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (_nome.text.isEmpty ||
                                  _valor.text.isEmpty ||
                                  beneficios.isEmpty) {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Text(
                                          'Informações incompletas para o cadastro favor revisar!',
                                          textAlign: TextAlign.center,
                                        )));
                              } else {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                        backgroundColor: Colors.green,
                                        content: Text(
                                          'Cadastrado com sucesso!',
                                          textAlign: TextAlign.center,
                                        )));
                                setState(() {
                                  _nome.clear();
                                  _valor.clear();
                                  _beneficio.clear();
                                  beneficios.clear();
                                });
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                              width: Get.width,
                              height: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 3,
                                    spreadRadius: 2,
                                    blurStyle: BlurStyle.normal,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'Cadastrar',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
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
      ),
    );
  }
}
