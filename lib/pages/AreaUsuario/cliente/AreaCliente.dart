import 'package:flutter/material.dart';
import 'package:temaqui/data/config.dart';

class AreaCliente extends StatefulWidget {
  AreaCliente({Key? key, required this.username}) : super(key: key);
  String username;
  @override
  State<AreaCliente> createState() => _AreaClienteState();
}

class _AreaClienteState extends State<AreaCliente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Bem-Vindo! ${widget.username}'),
        backgroundColor: primaryColor,
      ),
    );
  }
}
