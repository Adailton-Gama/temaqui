import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:temaqui/data/config.dart';
import 'package:temaqui/pages/commons/CategoriaTile.dart';

import 'EditarSubCategoria.dart';

class EditarCategorias extends StatefulWidget {
  const EditarCategorias({Key? key}) : super(key: key);

  @override
  State<EditarCategorias> createState() => _EditarCategoriasState();
}

class _EditarCategoriasState extends State<EditarCategorias> {
  final CollectionReference refCat =
      FirebaseFirestore.instance.collection('Categorias');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Editar Categorias'),
        centerTitle: true,
        bottom: PreferredSize(
          child: Container(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              'Selecione a categoria que deseja alterar',
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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    //
                    //Lista de Categorias
                    StreamBuilder(
                        stream: refCat.snapshots(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasData) {
                            return Expanded(
                              child: Container(
                                height: 200,
                                child: ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    final DocumentSnapshot documentSnapshot =
                                        snapshot.data!.docs[index];
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EditarSubCategoria(
                                                      id: documentSnapshot.id
                                                          .toString(),
                                                      categoria:
                                                          documentSnapshot[
                                                              'Categoria'],
                                                      img: documentSnapshot[
                                                          'catImg'],
                                                    )));
                                      },
                                      child: CategoriaTile(
                                        imgUrl: documentSnapshot['catImg'],
                                        categoria:
                                            documentSnapshot['Categoria'],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text(
                              'Erro ao Carregar dados!',
                              style: TextStyle(color: Colors.red),
                            );
                          }

                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
