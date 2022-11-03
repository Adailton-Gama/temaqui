import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temaqui/data/config.dart';
import 'package:temaqui/pages/prestadores/Tela/profissionais.dart';
import 'package:temaqui/pages/prestadores/Tela/subCategorias.dart';

import '../../commons/CategoriaTile.dart';

class ListaProfissionais extends StatefulWidget {
  ListaProfissionais({Key? key, required this.subcategoria}) : super(key: key);
  String subcategoria;
  @override
  State<ListaProfissionais> createState() => _ListaProfissionaisState();
}

class _ListaProfissionaisState extends State<ListaProfissionais> {
  final CollectionReference refProf =
      FirebaseFirestore.instance.collection('Usuarios');
  List subcategorias = [];
  @override
  void initState() {
    // TODO: implement initState
    getSubcategoria();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.subcategoria.toUpperCase()),
        centerTitle: true,
        backgroundColor: primaryColor,
        bottom: PreferredSize(
          child: Container(
            height: 20,
          ),
          preferredSize: Size.fromHeight(40),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            subcategorias.isNotEmpty
                ? Expanded(
                    child: Container(
                      height: 10,
                      width: Get.size.width,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: subcategorias.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Profissional()));
                            },
                            child: CategoriaTile(
                              categoria: subcategorias[index]['nome'],
                              imgUrl: subcategorias[index]['foto'],
                            ),
                          );
                        },
                      ),
                    ),
                  )
                : Expanded(
                    child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(5),
                    child: Text(
                      'Nenhum Profissional Cadastrado Ainda!',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  )),
          ],
        ),
      ),
    );
  }

  void getSubcategoria() async {
    final result = await FirebaseFirestore.instance
        .collection('Usuarios')
        .where('subcategoria', isEqualTo: widget.subcategoria)
        .where('autorizado', isEqualTo: 'sim')
        .where('nivel', isEqualTo: 'profissional')
        .get();
    setState(() {
      subcategorias = result.docs.map((e) => e.data()).toList();
    });
  }
}
