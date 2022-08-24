import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temaqui/pages/commons/tile_contact.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/config.dart';

class FaleConosco extends StatefulWidget {
  FaleConosco(
      {Key? key, this.isDraw = false, this.xOffset = 300, this.yOffset = 80})
      : super(key: key);
  bool isDraw;
  double xOffset;
  double yOffset;

  @override
  State<FaleConosco> createState() => _FaleConoscoState();
}

class _FaleConoscoState extends State<FaleConosco> {
  @override
  bool isDrawerOpen = false;

  Future<void> _launcheInApp(String url) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

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
                child: SingleChildScrollView(
              physics: widget.isDraw
                  ? NeverScrollableScrollPhysics()
                  : BouncingScrollPhysics(),
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
                                    'FALE CONOSCO',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.center,
                                        width: Get.size.width - 10,
                                        padding: EdgeInsets.only(right: 10),
                                        child: Wrap(
                                          children: [
                                            Text(
                                              'Em caso de dúvida entre em contato:',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'Arial',
                                                decoration: TextDecoration.none,
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
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
                          padding: EdgeInsets.all(5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              height: 2,
                                              color: primaryColor,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'Redes Sociais',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: 'Arial',
                                                decoration: TextDecoration.none,
                                                color: primaryColor,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Expanded(
                                            child: Container(
                                              height: 2,
                                              color: primaryColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          try {
                                            _launcheInApp(
                                                'https://instagram.com/temaquiprofissionais?igshid=YmMyMTA2M2Y=');
                                            print('object');
                                          } catch (e) {
                                            print(e);
                                          }
                                        },
                                        child: ChatTile(
                                          selecionado: true,
                                          label: 'Instagram',
                                          icon: 'assets/instagram.png',
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          try {
                                            _launcheInApp(
                                                'https://www.facebook.com/abraao.lucas1407');
                                            print('object');
                                          } catch (e) {
                                            print(e);
                                          }
                                        },
                                        child: ChatTile(
                                          selecionado: true,
                                          label: 'Facebook',
                                          icon: 'assets/facebook.png',
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              height: 2,
                                              color: primaryColor,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'Ou',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: 'Arial',
                                                decoration: TextDecoration.none,
                                                color: primaryColor,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Expanded(
                                            child: Container(
                                              height: 2,
                                              color: primaryColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          try {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                      content: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Text('Chat')
                                                        ],
                                                      ),
                                                    ));
                                            print('Chat Aberto');
                                          } catch (e) {
                                            print(e);
                                          }
                                        },
                                        child: ChatTile(
                                          selecionado: true,
                                          label: 'Chat',
                                          icon: 'assets/chat.png',
                                        ),
                                      ),
                                    ],
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
            )),
          ],
        ),
      ),
    );
  }
}
