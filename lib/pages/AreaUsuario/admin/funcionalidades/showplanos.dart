import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temaqui/data/config.dart';

class ShowPlanos extends StatefulWidget {
  const ShowPlanos({Key? key}) : super(key: key);

  @override
  State<ShowPlanos> createState() => _ShowPlanosState();
}

class _ShowPlanosState extends State<ShowPlanos> {
  List beneficios = [1, 2];
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
                          for (var b in beneficios)
                            Container(
                              color: Colors.white,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(top: 10),
                                          padding: EdgeInsets.only(bottom: 10),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                              color: primaryColor,
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              //
                                              //Barra
                                              Container(
                                                decoration: BoxDecoration(
                                                  gradient: appBarGradient,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20)),
                                                ),
                                                height: 50,
                                                width: Get.size.width,
                                              ),
                                              SizedBox(height: 50),
                                              //
                                              //Título do plano
                                              Text(
                                                'Plano Tal'.toUpperCase(),
                                                style: TextStyle(
                                                  color: primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              //
                                              //Dados beneficios
                                              for (var ben in beneficios)
                                                Container(
                                                  padding: EdgeInsets.all(5),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        height: 10,
                                                        width: 10,
                                                        margin: EdgeInsets.only(
                                                            right: 10),
                                                        decoration: BoxDecoration(
                                                            color:
                                                                secundaryColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100)),
                                                      ),
                                                      Expanded(
                                                        child: Container(
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
                                                  fontWeight: FontWeight.w400,
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
                                                MainAxisAlignment.center,
                                            children: [
                                              Align(
                                                alignment: Alignment.topCenter,
                                                child: Container(
                                                  padding: EdgeInsets.all(15),
                                                  margin:
                                                      EdgeInsets.only(top: 10),
                                                  height: 80,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: primaryColor,
                                                        blurRadius: 5,
                                                        spreadRadius: 2,
                                                      )
                                                    ],
                                                    border: Border.all(
                                                      color: primaryColor,
                                                      width: 2,
                                                      style: BorderStyle.solid,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
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
                            )
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
