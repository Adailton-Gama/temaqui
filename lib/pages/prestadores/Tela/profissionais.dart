import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:temaqui/data/back4app.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../../data/config.dart';

class ListaProfissionais extends StatefulWidget {
  const ListaProfissionais({Key? key}) : super(key: key);

  @override
  State<ListaProfissionais> createState() => _ListaProfissionaisState();
}

class _ListaProfissionaisState extends State<ListaProfissionais> {
  TextEditingController cat = TextEditingController();
  PickedFile? catImg;
  TextEditingController subCat = TextEditingController();
  PickedFile? subCatImg;
  final storage = FirebaseStorage.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Back4app.initParse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        bottom: PreferredSize(
          child: Container(
            height: 20,
          ),
          preferredSize: Size.fromHeight(40),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: cat,
                decoration: InputDecoration(
                  label: Text('Nome da Categoria'),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  PickedFile? categoriaImg =
                      await ImagePicker().getImage(source: ImageSource.gallery);
                  setState(() {
                    catImg = categoriaImg;
                  });
                },
                child: catImg != null
                    ? Container(
                        height: 200,
                        width: 200,
                        child: Image.file(File(catImg!.path)),
                      )
                    : Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Align(
                            alignment: Alignment.center,
                            child: Text('Inserir Imagem da Categoria')),
                      ),
              ),
              SizedBox(
                height: 30,
              ),
              Divider(
                color: Colors.red,
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: subCat,
                decoration: InputDecoration(
                  label: Text('Nome da subcategoria'),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  PickedFile? subCat =
                      await ImagePicker().getImage(source: ImageSource.gallery);
                  setState(() {
                    subCatImg = subCat;
                  });
                },
                child: subCatImg != null
                    ? Container(
                        height: 200,
                        width: 200,
                        child: Image.file(File(subCatImg!.path)),
                      )
                    : Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Align(
                            alignment: Alignment.center,
                            child: Text('Inserir Imagem da subcategoria')),
                      ),
              ),
              ElevatedButton(
                  onPressed: () => addCategoria(), child: Text('Cadastrar')),
            ],
          ),
        ),
      ),
    );
  }

  addCategoria() async {
    final ref = storage.ref();
    var colection = FirebaseFirestore.instance.collection('Categorias');

    cat.text;
    catImg;
    subCat.text;
    subCatImg;
    // ParseFileBase? parseCatImg;
    // parseCatImg = ParseFile(File(catImg!.path));
    // ParseFileBase? parseSubCatImg;
    // parseSubCatImg = ParseFile(File(subCatImg!.path));
    var file = File(catImg!.path);
    var imgCat = await storage.ref().child('images/${cat.text}/').putFile(file);
    var imgUrl = await imgCat.ref.getDownloadURL();

    colection.doc(cat.text).set({
      'Categoria': cat.text,
      'catImg': imgUrl,
    });
    print(imgUrl.toString());

    // var categoria = ParseObject('Categorias')
    //   ..set('Categoria', cat.text)
    //   ..set('subCategoria', subCat.text)
    //   ..set('subCategoriaImg', parseSubCatImg);
    // await categoria.save();

    // var nomeCategoria = ParseObject('NomesCategorias')
    //   ..set('Categoria', cat.text)
    //   ..set('catImg', parseCatImg);
    // await nomeCategoria.save();

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Cadastrado com sucesso!')));
    setState(() {
      cat.text = '';
      subCat.text = '';
      catImg = null;
      subCatImg = null;
    });
  }
}
