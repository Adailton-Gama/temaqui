import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:temaqui/data/config.dart';
import 'package:temaqui/pages/commons/TextForm.dart';

class PerfilProfissional extends StatefulWidget {
  var usuario;
  PerfilProfissional({Key? key, required this.usuario}) : super(key: key);

  @override
  State<PerfilProfissional> createState() => _PerfilProfissionalState();
}

class _PerfilProfissionalState extends State<PerfilProfissional> {
  MaskTextInputFormatter telefone =
      MaskTextInputFormatter(mask: '(##) #####-####');
  MaskTextInputFormatter normal = MaskTextInputFormatter();
  TextEditingController whatsapp = TextEditingController();
  TextEditingController descAtividade = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            //AppBar
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
                    'Perfil Profissional',
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
            //Corpo da Página
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                height: 10,
                width: Get.size.width,
                color: Colors.white,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      //WhatsApp
                      Text(
                        'WhatsApp para divulgação',
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CustomTextForm(
                        padding: 5,
                        label: 'Telefone',
                        userControler: whatsapp,
                        mask: telefone,
                        validacao: () {
                          if (whatsapp.text == null || whatsapp.text.isEmpty) {
                            return 'Favor Preencher Campo';
                          }
                        },
                      ),
                      //
                      SizedBox(height: 20),
                      //Descrição da atividade
                      Text(
                        'Descrição das suas atividades:',
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CustomTextForm(
                        padding: 5,
                        label: 'Atividade',
                        userControler: descAtividade,
                        mask: normal,
                        validacao: () {
                          if (descAtividade.text == null ||
                              descAtividade.text.isEmpty) {
                            return 'Favor Preencher Campo';
                          }
                        },
                      ),
                      //
                      SizedBox(height: 20),
                      //Fotos
                      Text(
                        'Adicione imagens dos seus serviços, para atrair mais clientes',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 300,
                        margin: EdgeInsets.only(top: 5),
                        width: Get.size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                              color: primaryColor,
                              width: 2,
                              style: BorderStyle.solid),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Fotos: 1/3',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: primaryColor),
                            onPressed: () {},
                            child: Text('Visualizar Fotos'),
                          ),
                        ],
                      ),
                      //
                      //Botão
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
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
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.check,
                                    color: primaryColor,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Concluir',
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
            ),
          ],
        ),
      ),
    );
  }
}
