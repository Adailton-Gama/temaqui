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
  List beneficios = [1, 2, 3];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: widget.isDraw
            ? () {
                setState(() {
                  widget.xOffset = 0;
                  widget.yOffset = 0;
                  widget.isDraw = false;
                });
              }
            : null,
        child: AnimatedContainer(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: widget.isDraw
                ? BorderRadius.circular(20)
                : BorderRadius.circular(0),
            boxShadow: [
              widget.isDraw
                  ? BoxShadow(
                      color: Colors.grey, blurRadius: 5, spreadRadius: 2)
                  : BoxShadow()
            ],
          ),
          transform:
              Matrix4.translationValues(widget.xOffset, widget.yOffset, 0)
                ..scale(widget.isDraw ? 0.85 : 1.00)
                ..rotateZ(widget.isDraw ? -50 : 0),
          duration: const Duration(milliseconds: 500),
          child: Column(
            children: <Widget>[
              //AppBar
              Container(
                height: 120,
                decoration: BoxDecoration(
                  gradient: appBarGradient,
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
                                        widget.xOffset = Get.size.width -
                                            Get.size.width * .1;
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
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ],
                        ),
                      ),

                      //Linha 02
                      // Expanded(
                      //   child: Container(
                      //     padding: EdgeInsets.only(left: 10),
                      //     child: Row(
                      //       children: <Widget>[
                      //         Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           children: <Widget>[
                      //             Text(
                      //               'SUBTITLE',
                      //               style: TextStyle(
                      //                   color: Colors.white,
                      //                   fontSize: 30,
                      //                   fontWeight: FontWeight.bold),
                      //             ),
                      //             Text(
                      //               'Description'.toUpperCase(),
                      //               style: TextStyle(
                      //                   color: Colors.white,
                      //                   fontSize: 20,
                      //                   fontWeight: FontWeight.w200),
                      //             ),
                      //           ],
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),

              //Corpo da Tela
              Expanded(
                child: IgnorePointer(
                  ignoring: widget.isDraw ? true : false,
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
                    child: SingleChildScrollView(
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
                                    //Caixa Planos:
                                    Container(
                                      color: Colors.white,
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 10),
                                                  padding: EdgeInsets.only(
                                                      bottom: 10),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    border: Border.all(
                                                      color: primaryColor,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      //
                                                      //Barra
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          gradient:
                                                              appBarGradient,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          20),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          20)),
                                                        ),
                                                        height: 50,
                                                        width: Get.size.width,
                                                      ),
                                                      SizedBox(height: 50),
                                                      //
                                                      //Título do plano
                                                      Text(
                                                        'Plano Tal'
                                                            .toUpperCase(),
                                                        style: TextStyle(
                                                          color: primaryColor,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      //
                                                      //Dados beneficios
                                                      for (var ben
                                                          in beneficios)
                                                        Container(
                                                          padding:
                                                              EdgeInsets.all(5),
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                height: 10,
                                                                width: 10,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            10),
                                                                decoration: BoxDecoration(
                                                                    color:
                                                                        secundaryColor,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            100)),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  child: Text(
                                                                    'beneficios',
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      //
                                                      //Preço
                                                      Text(
                                                        'R\$ 50,00',
                                                        style: TextStyle(
                                                          color: primaryColor,
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: Get.size.width,
                                                  margin: EdgeInsets.all(10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            Alignment.topCenter,
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  15),
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 10),
                                                          height: 80,
                                                          width: 80,
                                                          decoration:
                                                              BoxDecoration(
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color:
                                                                    primaryColor,
                                                                blurRadius: 5,
                                                                spreadRadius: 2,
                                                              )
                                                            ],
                                                            border: Border.all(
                                                              color:
                                                                  primaryColor,
                                                              width: 2,
                                                              style: BorderStyle
                                                                  .solid,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100),
                                                            color: Colors.white,
                                                          ),
                                                          child: Image.asset(
                                                            'assets/planos_icones.png',
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ]),
                                    ),

                                    InkWell(
                                      onTap: () {
                                        TextEditingController nomeController =
                                            TextEditingController();
                                        TextEditingController
                                            descricaoController =
                                            TextEditingController();
                                        TextEditingController precoController =
                                            TextEditingController();
                                        showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                  content: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                          'Dados do Novo Plano'),
                                                      TextFormField(
                                                        controller:
                                                            nomeController,
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
                                                        controller:
                                                            precoController,
                                                      ),
                                                      SizedBox(
                                                        height: 30,
                                                      ),
                                                      ElevatedButton(
                                                          onPressed: () {
                                                            Planos newPlan = Planos(
                                                                nome:
                                                                    nomeController
                                                                        .text,
                                                                descricao:
                                                                    descricaoController
                                                                        .text,
                                                                preco: double.parse(
                                                                    precoController
                                                                        .text));
                                                            setState(() {
                                                              planos
                                                                  .add(newPlan);
                                                              Navigator.of(
                                                                      context)
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

                          // //Rodapé
                          // Container(
                          //   decoration: BoxDecoration(
                          //     color: Color.fromRGBO(81, 39, 227, 1),
                          //     borderRadius: widget.isDraw
                          //         ? BorderRadius.only(
                          //             bottomLeft: Radius.circular(20),
                          //             bottomRight: Radius.circular(20),
                          //           )
                          //         : BorderRadius.circular(0),
                          //   ),
                          //   height: 15,
                          // ),
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
