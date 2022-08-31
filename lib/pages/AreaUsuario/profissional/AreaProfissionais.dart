import 'package:flutter/material.dart';
import 'package:temaqui/data/config.dart';

class AreaProfissionais extends StatefulWidget {
  AreaProfissionais({Key? key, required this.username}) : super(key: key);
  String username;

  @override
  State<AreaProfissionais> createState() => _AreaProfissionaisState();
}

class _AreaProfissionaisState extends State<AreaProfissionais> {
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
