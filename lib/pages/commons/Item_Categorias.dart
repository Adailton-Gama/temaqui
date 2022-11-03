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
      margin: EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Container(
            height: 110,
            width: widget.widht,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.img),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                    color: primaryColor, width: 3, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Text(
            widget.nome,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: primaryColor, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
