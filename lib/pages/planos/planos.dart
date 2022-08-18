import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temaqui/data/data.dart';
import 'package:temaqui/pages/commons/Normal_Buttom.dart';
import 'package:temaqui/pages/commons/box_Plans.dart';

import '../../data/config.dart';

class NossosPlanos extends StatefulWidget {
  NossosPlanos(
      {Key? key, required this.isDraw, this.xOffset = 290, this.yOffset = 80})
      : super(key: key);
  bool isDraw;
  double xOffset = 290;
  double yOffset = 80;

  @override
  State<NossosPlanos> createState() => _NossosPlanosState();
}

class _NossosPlanosState extends State<NossosPlanos> {
  bool isDrawerOpen = false;
  List<Planos> planos = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedContainer(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: widget.isDraw
              ? BorderRadius.circular(20)
              : BorderRadius.circular(0),
        ),
        transform: Matrix4.translationValues(widget.xOffset, widget.yOffset, 0)
          ..scale(widget.isDraw ? 0.85 : 1.00)
          ..rotateZ(widget.isDraw ? -50 : 0),
        duration: const Duration(milliseconds: 500),
        child: Column(
          children: <Widget>[
            //AppBar
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Color.fromRGBO(81, 39, 227, 1),
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
              //AppBar
              child: Container(
                child: Column(
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
                                      widget.xOffset = 360;
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
                            'NOSSOS PLANOS',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //Linha 02
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'SUBTITLE',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Description'.toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w200),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Corpo da Tela
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: widget.isDraw
                      ? const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        )
                      : BorderRadius.circular(0),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: const Text(
                                  'Nossos Planos:',
                                  style: TextStyle(
                                    color: Color.fromRGBO(81, 39, 227, 1),
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              //Caixa Planos:
                              for (Planos plano in planos)
                                BoxPlains(
                                    nome: plano.nome,
                                    descricao: plano.descricao,
                                    preco: plano.preco),

                              InkWell(
                                onTap: () {
                                  TextEditingController nomeController =
                                      TextEditingController();
                                  TextEditingController descricaoController =
                                      TextEditingController();
                                  TextEditingController precoController =
                                      TextEditingController();
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text('Dados do Novo Plano'),
                                                TextFormField(
                                                  controller: nomeController,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                TextFormField(
                                                  controller:
                                                      descricaoController,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                TextFormField(
                                                  controller: precoController,
                                                ),
                                                SizedBox(
                                                  height: 30,
                                                ),
                                                ElevatedButton(
                                                    onPressed: () {
                                                      Planos newPlan = Planos(
                                                          nome: nomeController
                                                              .text,
                                                          descricao:
                                                              descricaoController
                                                                  .text,
                                                          preco: double.parse(
                                                              precoController
                                                                  .text));
                                                      setState(() {
                                                        planos.add(newPlan);
                                                        Navigator.of(context)
                                                            .pop();
                                                      });
                                                    },
                                                    child: Text(
                                                        'Cadastrar Plano')),
                                              ],
                                            ),
                                          ));
                                },
                                child: Ink(
                                  child: NormalButtom(
                                    label: 'Add',
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    //Rodapé
                    Container(
                      color: Color.fromRGBO(81, 39, 227, 1),
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
