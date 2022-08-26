import 'package:flutter/material.dart';
import 'package:temaqui/data/config.dart';

class CategoriaTile extends StatelessWidget {
  const CategoriaTile({
    Key? key,
    required this.categoria,
    this.imgUrl = 'https://i.imgur.com/u1tclRg.png',
    this.descricao = '',
    this.readme = '',
  }) : super(key: key);
  final String categoria;
  final String descricao;
  final String imgUrl;
  final String readme;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10, left: 10, top: 10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(
              color: primaryColor, width: 2, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(imgUrl), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3,
                    blurStyle: BlurStyle.outer,
                    spreadRadius: 2,
                  ),
                ]),
          ),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    categoria.toUpperCase(),
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
