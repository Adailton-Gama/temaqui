import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:temaqui/pages/login/login_page.dart';
import 'package:temaqui/pages/mainPage/Main_Page.dart';

import '../../../data/config.dart';

class VerifyCode extends StatefulWidget {
  const VerifyCode({Key? key}) : super(key: key);

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  Timer? timer;
  int count = 30;
  void countTimer() async {
    timer = new Timer.periodic(Duration(seconds: 1), (timer) {
      if (count == 0) {
        setState(() {
          timer.cancel();
        });
        print('Habilitado para reenvio!');
      } else {
        setState(() {
          count--;
        });
        print(count);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    countTimer();
    super.initState();
  }

  @override
  void dispose() async {
    // TODO: implement dispose
    timer!.cancel();
    print('Voltou e cancelou o timer');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Botão Desativado por Segurança!',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.red,
          ),
        );
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
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
          backgroundColor: primaryColor,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: Get.size.height - Get.size.height * .20,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Lottie.asset(
                        'lottie/verifyCode.json',
                        height: Get.size.height / 4,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Verificação de Conta',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Insira Abaixo o código de verificação enviado no e-mail cadastrado!',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          style: TextStyle(color: primaryColor),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.key,
                              color: primaryColor,
                            ),
                            labelText: 'Código',
                            labelStyle: TextStyle(color: primaryColor),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: primaryColor, width: 2),
                                borderRadius: BorderRadius.circular(20)),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: primaryColor, width: 2),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                      ),
                      timer!.isActive
                          ? Text.rich(
                              TextSpan(
                                style: TextStyle(fontSize: 16),
                                children: [
                                  TextSpan(
                                      text: 'Aguarde ',
                                      style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 1))),
                                  TextSpan(
                                      text: '$count ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(0, 0, 0, 1))),
                                  TextSpan(
                                      text: 'segundos para reenviar o código!',
                                      style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 1))),
                                ],
                              ),
                            )
                          : TextButton(
                              onPressed: () {
                                setState(() {
                                  count = 30;
                                  countTimer();
                                });
                              },
                              child: Text(
                                'Reenviar Código',
                                style: TextStyle(
                                    fontSize: 16, color: primaryColor),
                              )),
                      SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: InkWell(
                          onTap: () {
                            print('Validar Código');
                            //Verificação do código
                            timer!.cancel();

                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => InitScreen()),
                                (route) => false);
                          },
                          child: Container(
                            height: 50,
                            width: Get.size.width,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Confirmar',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
