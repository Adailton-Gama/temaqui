import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:temaqui/data/back4app.dart';
import 'package:temaqui/data/config.dart';
import 'package:temaqui/data/data.dart';
import 'package:temaqui/pages/prestadores/Tela/profissionais.dart';

import '../../commons/CategoriaTile.dart';

class SubCategorias extends StatefulWidget {
  SubCategorias({Key? key, required this.categoria}) : super(key: key);
  Categorias categoria;

  @override
  State<SubCategorias> createState() => _SubCategoriasState();
}

class _SubCategoriasState extends State<SubCategorias> {
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
        title: Text(widget.categoria.nome.toUpperCase()),
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
                      image: NetworkImage(widget.categoria.img),
                      fit: BoxFit.cover),
                ),
              ),
              Expanded(
                child: Container(
                  height: 200,
                  child: FutureBuilder<List<ParseObject>>(
                    future: getData(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return Center(
                            child: Container(
                                width: 100,
                                height: 100,
                                child: CircularProgressIndicator()),
                          );
                        default:
                          if (snapshot.hasError) {
                            return Center(
                              child: Container(
                                  child: Text(
                                      'Erro: ${snapshot.error.toString()}')),
                            );
                          }
                          if (!snapshot.hasData) {
                            return Center(
                              child: Container(
                                  child: Text(
                                      'Nenhum Profissional Cadastrado nesta categoria')),
                            );
                          } else {
                            return ListView.builder(
                                physics: BouncingScrollPhysics(),
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  var subCategoria = snapshot.data![index];
                                  var imgUrl = subCategoria
                                      .get<ParseFileBase>('subCategoriaImg');
                                  var nome =
                                      subCategoria.get<String>('subCategoria');

                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ListaProfissionais()));
                                    },
                                    child: CategoriaTile(
                                      imgUrl: imgUrl!.url!,
                                      categoria: nome!,
                                      readme: ', Ver Mais.',
                                    ),
                                  );
                                });
                          }
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<ParseObject>> getData() async {
    QueryBuilder<ParseObject> queryRead =
        QueryBuilder<ParseObject>(ParseObject('Categorias'));

    final ParseResponse apiResponse = await queryRead.query();

    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }
}
