import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temaqui/pages/commons/Normal_Buttom.dart';

import '../commons/Border_Buttom.dart';
import '../commons/TextForm.dart';

class LoginPage extends StatefulWidget {
  LoginPage(
      {Key? key, this.isDraw = false, this.xOffset = 290, this.yOffset = 80})
      : super(key: key);
  bool isDraw;
  double xOffset;
  double yOffset;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double xOffset = 290;
  double yOffset = 80;
  bool isDrawerOpen = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var heigthbar = AppBar().preferredSize.height;
    var padding = MediaQuery.of(context).padding;
    final TextEditingController userControler = TextEditingController();
    final TextEditingController passControler = TextEditingController();

    bool isObscure = false;
    bool isSecret = false;

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
                            'LOGIN',
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

            //Corpo
            Expanded(
              child: IgnorePointer(
                ignoring: widget.isDraw ? true : false,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: widget.isDraw
                        ? BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))
                        : BorderRadius.circular(0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Color.fromRGBO(81, 39, 227, 1), width: 4),
                        ),
                        child: Icon(
                          Icons.lock_outline,
                          size: 80,
                          color: Color.fromRGBO(81, 39, 227, 1),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      CustomTextForm(
                        label: 'Usuário',
                        userControler: userControler,
                      ),
                      CustomTextForm(
                        label: 'Senha',
                        userControler: passControler,
                        isObscure: isSecret,
                      ),

                      //Entrar
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Material(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: () {
                              if (userControler.text == '1') {
                                print('Prestador');
                              } else if (userControler.text == '2') {
                                print('usuário');
                              }
                            },
                            child: Ink(
                              child: NormalButtom(
                                label: 'Entrar',
                              ),
                            ),
                          ),
                        ),
                      ),

                      //Cadastrar
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Material(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: () {
                              print('Cadastrar');
                            },
                            child: Ink(
                              child: BorderButtom(
                                label: 'Cadastrar',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
