import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../mainPage/Main_Page.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => InitScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.size.height,
        width: Get.size.width,
        color: Color.fromRGBO(116, 46, 145, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            //Retângulo Topo
            Row(
              children: <Widget>[
                Expanded(child: Container()),
                Expanded(
                  child: Container(
                    height: 20,
                    color: Color.fromRGBO(251, 199, 54, 1),
                  ),
                )
              ],
            ),

            //Imagem Logo
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    Image.asset(
                      'assets/logo_Full_White.png',
                      width: Get.size.width * .6,
                      filterQuality: FilterQuality.medium,
                    ),
                  ],
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        transform: Matrix4.translationValues(
                            Get.size.width * .1, 0, 0),
                        width: 100,
                        height: 50,
                        child: Lottie.asset('lottie/Loading.json'),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        transform: Matrix4.translationValues(
                            Get.size.width / 2, 120, 0)
                          ..rotateZ(49.8),
                        height: 200,
                        width: 200,
                        color: Color.fromRGBO(251, 199, 54, 1),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
