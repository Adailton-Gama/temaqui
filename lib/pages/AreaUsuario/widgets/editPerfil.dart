import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:temaqui/data/config.dart';
import '../../../data/config.dart' as config;
import '../../../data/data.dart';
import '../../commons/Normal_Buttom.dart';
import '../../commons/TextForm.dart';
import '../../login/nova_conta/commons/escolherCategoria.dart';

class EditPerfil extends StatefulWidget {
  const EditPerfil({Key? key}) : super(key: key);

  @override
  State<EditPerfil> createState() => _EditPerfilState();
}

class _EditPerfilState extends State<EditPerfil> {
  //
  //
  final MaskTextInputFormatter normal = MaskTextInputFormatter(mask: '');
  final MaskTextInputFormatter cpfmask =
      MaskTextInputFormatter(mask: '###.###.###-##');
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: primaryColor),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
          child: Column(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://cdn.discordapp.com/avatars/442050854581829656/b128666aa0305da5fbf31a4ed7d664dd.webp?size=128')),
                  borderRadius: BorderRadius.circular(100),
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
                label: 'E-mail',
                mask: normal,
              ),
              CustomTextForm(
                padding: 10,
                userControler: _senha,
                label: 'Senha',
                mask: normal,
              ),
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
                label: 'Nome Completo',
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
              //
              //Profissão
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
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
                                      borderRadius: BorderRadius.circular(20)),
                                  content: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                        padding: EdgeInsets.only(top: 10),
                                        height: Get.size.height / 2.3,
                                        child: ListView.builder(
                                            itemCount: planos.length,
                                            itemBuilder: (context, index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    selectedPlano =
                                                        '${planos[index].nome}    -    R\$ ${planos[index].preco.toStringAsFixed(2)}';
                                                    Navigator.of(context).pop();
                                                  });
                                                },
                                                child: EscolherCategoria(
                                                  nome: planos[index].nome,
                                                  descricao:
                                                      planos[index].descricao,
                                                  preco: planos[index].preco,
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
                        padding: EdgeInsets.all(10),
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: primaryColor, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  content: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                        padding: EdgeInsets.only(top: 10),
                                        height: Get.size.height / 2.3,
                                        child: ListView.builder(
                                            itemCount: planos.length,
                                            itemBuilder: (context, index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    selectedPlano =
                                                        '${planos[index].nome}    -    R\$ ${planos[index].preco.toStringAsFixed(2)}';
                                                    Navigator.of(context).pop();
                                                  });
                                                },
                                                child: EscolherCategoria(
                                                  nome: planos[index].nome,
                                                  descricao:
                                                      planos[index].descricao,
                                                  preco: planos[index].preco,
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
                        padding: EdgeInsets.all(10),
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: primaryColor, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                height: 10,
              ),
              Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              content: Text('Atualizar Account'),
                            ));
                  },
                  child: Ink(
                    child: NormalButtom(
                        color: secundaryColor,
                        labelColor: primaryColor,
                        label: 'Atualizar',
                        width: Get.size.width),
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
