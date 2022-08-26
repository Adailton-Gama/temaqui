import 'package:flutter/material.dart';
import 'package:temaqui/data/config.dart';

class EscolherCategoria extends StatefulWidget {
  EscolherCategoria(
      {Key? key,
      required this.nome,
      required this.descricao,
      required this.preco})
      : super(key: key);

  String nome;
  String descricao;
  double preco;

  @override
  State<EscolherCategoria> createState() => _EscolherCategoriaState();
}

class _EscolherCategoriaState extends State<EscolherCategoria> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border:
            Border.all(color: primaryColor, width: 2, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            widget.nome,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.descricao,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          Text(
            'R\$ ${widget.preco.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
