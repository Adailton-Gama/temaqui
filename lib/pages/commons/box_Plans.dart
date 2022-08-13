import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoxPlains extends StatefulWidget {
  BoxPlains(
      {Key? key,
      required this.nome,
      required this.descricao,
      required this.preco})
      : super(key: key);
  String nome;
  String descricao;
  double preco;

  @override
  State<BoxPlains> createState() => _BoxPlainsState();
}

class _BoxPlainsState extends State<BoxPlains> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        width: Get.size.width,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: <Widget>[
            Container(
                height: 50,
                width: Get.size.width,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(80, 39, 227, 1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //Icone
                    Icon(
                      Icons.workspace_premium_outlined,
                      color: Colors.white,
                    ),
                    //Título
                    Wrap(
                      children: [
                        Text(
                          widget.nome,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
            Wrap(
              children: [
                Text(
                  widget.descricao,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Text(
              'R\$ ${widget.preco.toString()}',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 30,
              ),
            ),
          ],
        ));
  }
}
