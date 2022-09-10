import 'package:flutter/material.dart';

import '../../../../data/config.dart';

class CadPlanos extends StatefulWidget {
  const CadPlanos({Key? key}) : super(key: key);

  @override
  State<CadPlanos> createState() => _CadPlanosState();
}

class _CadPlanosState extends State<CadPlanos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Gerenciar Planos'),
        centerTitle: true,
        bottom: PreferredSize(
          child: Container(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              '',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          preferredSize: Size.fromHeight(40),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [],
          ),
        ),
      ),
    );
  }
}
