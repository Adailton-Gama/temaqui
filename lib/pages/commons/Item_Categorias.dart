import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/config.dart';

class ItemCategorias extends StatefulWidget {
  ItemCategorias(
      {Key? key, required this.nome, required this.img, this.widht = 150})
      : super(key: key);
  final String nome;
  final String img;
  final double widht;

  @override
  State<ItemCategorias> createState() => _ItemCategoriasState();
}

class _ItemCategoriasState extends State<ItemCategorias> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: widget.widht,
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color: primaryColor, width: 2, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.img),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(5),
              width: Get.size.width,
              decoration: BoxDecoration(
                gradient: buttonGradient,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: Wrap(
                children: [
                  Text(
                    widget.nome,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
