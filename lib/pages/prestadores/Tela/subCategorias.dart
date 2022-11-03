import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:temaqui/data/back4app.dart';
import 'package:temaqui/data/config.dart';
import 'package:temaqui/data/data.dart';
import 'package:temaqui/pages/prestadores/Tela/profissionais.dart';

import '../../commons/CategoriaTile.dart';
import 'listProfissionais.dart';

class SubCategorias extends StatefulWidget {
  SubCategorias({Key? key, required this.categoria, required this.img})
      : super(key: key);
  String categoria;
  String img;

  @override
  State<SubCategorias> createState() => _SubCategoriasState();
}

class _SubCategoriasState extends State<SubCategorias> {
  // final CollectionReference refSubCat =
  //     FirebaseFirestore.instance.collection('Subcategorias').where('Categoria',isEqualTo: widget.categoria).get();
  @override
  List subcategorias = [];
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
        title: Text(widget.categoria.toUpperCase()),
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
        child: ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: Get.size.height, maxWidth: Get.size.width),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
                alignment: Alignment.center,
                height: Get.size.height / 4,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 5,
                        blurRadius: 3,
                        blurStyle: BlurStyle.normal)
                  ],
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(widget.img), fit: BoxFit.cover),
                ),
              ),
              Expanded(
                child: Container(
                  height: 200,
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: subcategorias.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ListaProfissionais(
                                      subcategoria: subcategorias[index]
                                              ['SubCategoria']
                                          .toString(),
                                    )));
                            // showDialog(
                            //   context: context,
                            //   builder: (context) => AlertDialog(
                            //     content: Image.network(
                            //         '${subcategorias[index]['catImg'].toString()}'),
                            //   ),
                            // );
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => ListaProfissionais()));
                          },
                          child: CategoriaTile(
                            imgUrl: subcategorias[index]['catImg'].toString(),
                            categoria:
                                subcategorias[index]['SubCategoria'].toString(),
                            readme: ', Ver Mais.',
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getSubcategoria() async {
    final result = await FirebaseFirestore.instance
        .collection('Subcategorias')
        .where('Categoria', isEqualTo: widget.categoria)
        .get();
    setState(() {
      subcategorias = result.docs.map((e) => e.data()).toList();
    });
  }
}
