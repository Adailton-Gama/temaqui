import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:temaqui/data/back4app.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:temaqui/data/config.dart';

class CadCategorias extends StatefulWidget {
  const CadCategorias({Key? key}) : super(key: key);

  @override
  State<CadCategorias> createState() => _CadCategoriasState();
}

class _CadCategoriasState extends State<CadCategorias> {
  final CollectionReference refCat =
      FirebaseFirestore.instance.collection('Categorias');
  TextEditingController cat = TextEditingController();
  PickedFile? catImg;
  TextEditingController subCat = TextEditingController();
  PickedFile? subCatImg;
  final storage = FirebaseStorage.instance;
  String categoria = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Back4app.initParse();
  }

  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Gerenciar Categorias'),
        centerTitle: true,
        bottom: PreferredSize(
          child: Container(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              'Selecione o que deseja cadastrar',
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
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isChecked = !isChecked;
                  });
                  print(isChecked);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      alignment: isChecked
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      children: [
                        Container(
                          height: 20,
                          width: 40,
                          decoration: BoxDecoration(
                            color: isChecked ? primaryColor : secundaryColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        AnimatedContainer(
                          curve: Curves.fastLinearToSlowEaseIn,
                          transform: isChecked
                              ? Matrix4.translationValues(0, 0, 0)
                              : Matrix4.translationValues(10, 0, 0),
                          margin: isChecked
                              ? EdgeInsets.only(left: 5)
                              : EdgeInsets.only(right: 15),
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            color: isChecked ? secundaryColor : primaryColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          duration: Duration(seconds: 1),
                        ),
                      ],
                    ),
                    isChecked
                        ? Text(
                            ' Cadastrar Categoria',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        : Text(
                            ' Cadastrar Subcategoria',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                  ],
                ),
              ),
              isChecked
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 10),
                        TextField(
                          controller: cat,
                          decoration: InputDecoration(
                            label: Text('Nome da Categoria'),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            PickedFile? categoriaImg = await ImagePicker()
                                .getImage(source: ImageSource.gallery);
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
                                      child:
                                          Text('Inserir Imagem da Categoria')),
                                ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text('Categoria: '),
                            Expanded(child: Text(categoria.toString())),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          content: StreamBuilder(
                                              stream: refCat.snapshots(),
                                              builder: (context,
                                                  AsyncSnapshot<QuerySnapshot>
                                                      snapshot) {
                                                if (snapshot.hasData) {
                                                  return Container(
                                                    height: 200,
                                                    child: ListView.builder(
                                                      itemCount: snapshot
                                                          .data!.docs.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        final DocumentSnapshot
                                                            documentSnapshot =
                                                            snapshot.data!
                                                                .docs[index];
                                                        return GestureDetector(
                                                          onTap: () =>
                                                              selecionarCategoria(
                                                                  documentSnapshot
                                                                      .id),
                                                          child: Container(
                                                            margin: EdgeInsets
                                                                .fromLTRB(
                                                                    0, 5, 0, 0),
                                                            padding: EdgeInsets
                                                                .fromLTRB(5, 10,
                                                                    5, 10),
                                                            decoration: BoxDecoration(
                                                                color:
                                                                    primaryColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20)),
                                                            child: Text(
                                                              '${documentSnapshot['Categoria'].toString()}',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  );
                                                } else if (snapshot.hasError) {
                                                  return Text(
                                                    'Erro ao Carregar dados!',
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  );
                                                }

                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              }),
                                        ));
                              },
                              child: Container(
                                padding: EdgeInsets.only(right: 10, left: 10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                height: 25,
                                child: Text(
                                  'Escolher Categoria',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        TextField(
                          controller: subCat,
                          decoration: InputDecoration(
                            label: Text('Nome da subcategoria'),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            PickedFile? subCat = await ImagePicker()
                                .getImage(source: ImageSource.gallery);
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
                                      child: Text(
                                          'Inserir Imagem da subcategoria')),
                                ),
                        ),
                      ],
                    ),
              isChecked
                  ? ElevatedButton(
                      onPressed: () => addCategoria(), child: Text('Cadastrar'))
                  : ElevatedButton(
                      onPressed: () => addSubCategoria(),
                      child: Text('Cadastrar')),
            ],
          ),
        ),
      ),
    );
  }

  selecionarCategoria(String id) {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    final docRef = firebaseFirestore.collection('Categorias').doc(id);
    docRef.get().then((DocumentSnapshot snapshot) {
      var data = snapshot.data() as Map<String, dynamic>;
      setState(() {
        categoria = data['Categoria'].toString();
      });
      Navigator.pop(context);
    });
  }

  addCategoria() async {
    final ref = storage.ref();
    var colection = FirebaseFirestore.instance.collection('Categorias');

    cat.text;
    catImg;
    subCat.text;
    subCatImg;
    var file = File(catImg!.path);
    var imgCat = await storage.ref().child('images/${cat.text}/').putFile(file);
    var imgUrl = await imgCat.ref.getDownloadURL();

    colection.doc(cat.text).set({
      'Categoria': cat.text,
      'catImg': imgUrl,
    });
    print(imgUrl.toString());

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

  addSubCategoria() async {
    final ref = storage.ref();
    var colection = FirebaseFirestore.instance.collection('Subcategorias');

    categoria;
    subCat.text;
    subCatImg;
    var file = File(subCatImg!.path);
    var imgSubCat =
        await storage.ref().child('images/${subCat.text}/').putFile(file);
    var imgUrl = await imgSubCat.ref.getDownloadURL();

    colection.doc(subCat.text).set({
      'Categoria': categoria.toString(),
      'SubCategoria': subCat.text,
      'catImg': imgUrl,
    });
    print(imgUrl.toString());

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
