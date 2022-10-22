import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:temaqui/data/config.dart';
import 'package:temaqui/pages/commons/CategoriaTile.dart';

class EditarSubCategoria extends StatefulWidget {
  EditarSubCategoria(
      {Key? key, required this.categoria, required this.img, required this.id})
      : super(key: key);
  String categoria;
  String img;
  String id;

  @override
  State<EditarSubCategoria> createState() => _EditarSubCategoriaState();
}

class _EditarSubCategoriaState extends State<EditarSubCategoria> {
  final storage = FirebaseStorage.instance;
  List subcategorias = [];
  PickedFile? catImg;
  PickedFile? subCatImg;
  var subIndex;

  TextEditingController nomeCategoria = TextEditingController();
  TextEditingController nomeSubCategoria = TextEditingController();

  void initState() {
    // TODO: implement initState
    getSubcategoria();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      nomeCategoria.text = widget.id;
    });
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Editar ${widget.categoria}'),
        centerTitle: true,
        backgroundColor: primaryColor,
        bottom: PreferredSize(
          child: Container(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: secundaryColor),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => StatefulBuilder(
                    builder: ((context, StateSetter setState) => AlertDialog(
                          content: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Editar Dados da categoria'.toUpperCase(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 20),
                                TextFormField(
                                  controller: nomeCategoria,
                                  decoration: InputDecoration(
                                      labelText: widget.id,
                                      isDense: true,
                                      border: OutlineInputBorder()),
                                ),
                                SizedBox(height: 20),
                                GestureDetector(
                                  onTap: () async {
                                    PickedFile? categoriaImg =
                                        await ImagePicker().getImage(
                                            source: ImageSource.gallery);
                                    setState(() => catImg = categoriaImg);
                                  },
                                  child: catImg != null
                                      ? Container(
                                          height: 200,
                                          child: Image.file(File(catImg!.path)),
                                        )
                                      : Container(
                                          height: 200,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(widget.img),
                                              ),
                                              border: Border.all(
                                                  color: Colors.black)),
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Text(
                                              'Aperte para Alterar a Imagem',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                ),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () async {
                                    atualizarCategoria();
                                    this.setState(() {});
                                  },
                                  child: Text('ATUALIZAR'),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ),
                );
              },
              child: Text(
                'Editar Categoria',
                style: TextStyle(color: Colors.black),
              ),
            ),
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
                            subIndex = subcategorias[index]['Id'].toString();
                            nomeSubCategoria.text =
                                subcategorias[index]['SubCategoria'].toString();
                            showDialog(
                              context: context,
                              builder: (context) => StatefulBuilder(
                                builder: ((context, StateSetter setState) =>
                                    AlertDialog(
                                      content: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Editar Dados da Subcategoria'
                                                  .toUpperCase(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 20),
                                            TextFormField(
                                              controller: nomeCategoria,
                                              decoration: InputDecoration(
                                                  labelText: nomeCategoria.text,
                                                  isDense: true,
                                                  border: OutlineInputBorder()),
                                            ),
                                            SizedBox(height: 20),
                                            TextFormField(
                                              controller: nomeSubCategoria,
                                              decoration: InputDecoration(
                                                  labelText:
                                                      nomeSubCategoria.text,
                                                  isDense: true,
                                                  border: OutlineInputBorder()),
                                            ),
                                            SizedBox(height: 20),
                                            GestureDetector(
                                              onTap: () async {
                                                PickedFile? subCategoriaImg =
                                                    await ImagePicker()
                                                        .getImage(
                                                            source: ImageSource
                                                                .gallery);
                                                setState(() => subCatImg =
                                                    subCategoriaImg);
                                              },
                                              child: subCatImg != null
                                                  ? Container(
                                                      height: 200,
                                                      child: Image.file(File(
                                                          subCatImg!.path)),
                                                    )
                                                  : Container(
                                                      height: 200,
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                  subcategorias[
                                                                              index]
                                                                          [
                                                                          'catImg']
                                                                      .toString())),
                                                          border: Border.all(
                                                              color: Colors
                                                                  .black)),
                                                      child: Align(
                                                          alignment: Alignment
                                                              .bottomCenter,
                                                          child: Text(
                                                            'Aperte para Alterar a Imagem',
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.red,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                    ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () async {
                                                editSubCategoria();
                                                this.setState(() {});
                                              },
                                              child: Text('ATUALIZAR'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                              ),
                            );
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

  atualizarCategoria() async {
    final ref = storage.ref();
    var colection = FirebaseFirestore.instance.collection('Categorias');

    if (catImg != null) {
      var file = File(catImg!.path);
      var imgCat = await storage
          .ref()
          .child('images/${nomeCategoria.text}/')
          .putFile(file);
      var imgUrl = await imgCat.ref.getDownloadURL();

      colection.doc(widget.id).update({
        'Categoria': nomeCategoria.text,
        'catImg': imgUrl,
      });
    } else {
      colection.doc(widget.id).update({
        'Categoria': nomeCategoria.text,
      });
    }

    Navigator.of(context).pop();
  }

  void editSubCategoria() async {
    final ref = storage.ref();
    var colection = FirebaseFirestore.instance.collection('Subcategorias');
    //
    //
    if (subCatImg != null) {
      var file = File(subCatImg!.path);
      var imgSubCat = await storage
          .ref()
          .child('images/${nomeSubCategoria.text}/')
          .putFile(file);
      var imgUrl = await imgSubCat.ref.getDownloadURL();

      colection.doc(subIndex.toString()).update({
        'Id': subIndex,
        'Categoria': nomeCategoria.text,
        'SubCategoria': nomeSubCategoria.text,
        'catImg': imgUrl,
      });
    } else {
      colection.doc(subIndex.toString()).update({
        'Id': subIndex,
        'Categoria': nomeCategoria.text,
        'SubCategoria': nomeSubCategoria.text
      });
    }
    Navigator.of(context).pop();
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
