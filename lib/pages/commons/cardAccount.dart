import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../data/config.dart';

class CardAccount extends StatefulWidget {
  CardAccount(
      {Key? key,
      required this.nivel,
      required this.descricao,
      required this.animation})
      : super(key: key);
  final String nivel;
  final String descricao;
  final String animation;

  @override
  State<CardAccount> createState() => _CardAccountState();
}

class _CardAccountState extends State<CardAccount> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        border:
            Border.all(color: primaryColor, width: 1, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(20),
      ),
      height: 150,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  width: 120,
                  decoration: BoxDecoration(
                    gradient: appBarGradient,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15)),
                  ),
                  child: Lottie.asset('${widget.animation}'),
                ),
              ),
            ],
          ),
          Container(
            width: Get.size.width - Get.size.width * .4,
            padding: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.nivel,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Arial',
                      decoration: TextDecoration.none,
                      color: primaryColor,
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Wrap(
                  children: [
                    Text(
                      widget.descricao,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontFamily: 'Arial',
                        decoration: TextDecoration.none,
                        color: primaryColor,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
