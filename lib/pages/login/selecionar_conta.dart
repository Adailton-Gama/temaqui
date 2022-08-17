import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:temaqui/data/config.dart';

import '../commons/cardAccount.dart';

class SelectAcc extends StatefulWidget {
  SelectAcc({Key? key, this.isDraw = false, this.xOffset = 0, this.yOffset = 0})
      : super(key: key);
  bool isDraw;
  double xOffset;
  double yOffset;
  @override
  State<SelectAcc> createState() => _SelectAccState();
}

class _SelectAccState extends State<SelectAcc> {
  @override
  bool isDrawerOpen = false;
  List categorias = [1, 1, 1, 1, 1, 1, 1, 1];
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
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
                child: SingleChildScrollView(
              physics: widget.isDraw
                  ? NeverScrollableScrollPhysics()
                  : BouncingScrollPhysics(),
              child: Container(
                height: Get.size.height + Get.size.height * 0.3,
                child: Column(
                  children: [
                    //AppBar
                    Container(
                      height: Get.size.height * .3,
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
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(81, 39, 227, 0.5),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  widget.isDraw
                                      ? Material(
                                          color: Colors.transparent,
                                          child: InkWell(
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
                                          ),
                                        )
                                      : Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                widget.xOffset =
                                                    Get.size.width -
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
                                        ),
                                  Text(
                                    '',
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
                            Container(
                              padding: EdgeInsets.only(left: 10, bottom: 20),
                              child: Row(
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'JUNTE-SE A NÓS',
                                        style: TextStyle(
                                            fontFamily: 'Arial',
                                            decoration: TextDecoration.none,
                                            color: Colors.white,
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Container(
                                        width: Get.size.width - 10,
                                        padding: EdgeInsets.only(right: 10),
                                        child: Wrap(
                                          children: [
                                            Text(
                                              'Os melhores profissionais em um só App!',
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
                        child: Container(
                          height: Get.size.height,
                          padding: EdgeInsets.all(5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 20, bottom: 20),
                                child: Text(
                                  'Escolha o tipo de conta que \ndeseja criar:',
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
                              CardAccount(
                                animation: 'lottie/workers.json',
                                nivel: 'Profissional',
                                descricao:
                                    'Traga toda sua habilidade e sua experiência para o nosso App.',
                              ),

                              //Card Cliente
                              CardAccount(
                                animation: 'lottie/clients.json',
                                nivel: 'Cliente',
                                descricao:
                                    'Faça parte da nossa família e contrate já os melhores profissionais!',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
