import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:temaqui/data/config.dart';
import 'package:temaqui/pages/commons/Normal_Buttom.dart';
import 'package:temaqui/pages/login/selecionar_conta.dart';
import 'package:temaqui/pages/mainPage/Main_Page.dart';

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
              height: 100,
              decoration: BoxDecoration(
                color: Color.fromRGBO(81, 39, 227, 1),
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
                            'ÁREA DO USUÁRIO',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
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
                    //               'ÁREA DO USUÁRIO',
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

            //Corpo
            Expanded(
              child: IgnorePointer(
                ignoring: widget.isDraw ? true : false,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          height: Get.size.height / 4,
                          padding: EdgeInsets.all(0),
                          child: Lottie.asset(
                            'lottie/login.json',
                          ),
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
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Esqueceu a senha?',
                                style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                        SizedBox(
                          height: 20,
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
                                stackOrder.clear();
                                setState(() {
                                  stackOrder.add(SelectAcc(
                                    xOffset: 0,
                                    yOffset: 0,
                                  ));
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => InitScreen()));
                                });
                                print(stackOrder[0]);
                              },
                              child: Ink(
                                child: BorderButtom(
                                  label: 'Cadastre-se',
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
            )
          ],
        ),
      ),
    );
  }
}
