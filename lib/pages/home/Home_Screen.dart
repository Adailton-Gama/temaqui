import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:temaqui/data/config.dart';
import 'package:temaqui/data/data.dart';
import 'package:temaqui/pages/commons/Item_Categorias.dart';

import '../commons/CategoriaTile.dart';
import '../mainPage/Main_Page.dart';
import '../prestadores/Tela/listProfissionais.dart';
import '../prestadores/Tela/profissionais.dart';
import '../prestadores/Work_Page.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen(
      {Key? key, this.isDraw = false, this.xOffset = 0, this.yOffset = 0})
      : super(key: key);
  bool isDraw;
  double xOffset;
  double yOffset;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController encontrarProfissional = TextEditingController();
  @override
  bool isDrawerOpen = false;
  bool isResearched = false;
  List<Categorias> categorias = [];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var heigthbar = AppBar().preferredSize.height;
    var padding = MediaQuery.of(context).padding;
    return SafeArea(
      child: GestureDetector(
        onTap: widget.isDraw
            ? () {
                setState(() {
                  widget.xOffset = 0;
                  widget.yOffset = 0;
                  widget.isDraw = false;
                });
              }
            : null,
        child: AnimatedContainer(
          height: Get.size.height,
          width: Get.size.width,
          transform:
              Matrix4.translationValues(widget.xOffset, widget.yOffset, 0)
                ..scale(widget.isDraw ? 0.85 : 1.00)
                ..rotateZ(widget.isDraw ? -50 : 0),
          duration: Duration(milliseconds: 500),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: widget.isDraw
                ? BorderRadius.circular(20)
                : BorderRadius.circular(0),
            boxShadow: [
              widget.isDraw
                  ? BoxShadow(
                      color: Colors.grey, blurRadius: 5, spreadRadius: 2)
                  : BoxShadow()
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                  child: Container(
                height: Get.size.height + Get.size.height * 0.3,
                child: Column(
                  children: [
                    //AppBar
                    Container(
                      height: Get.size.height * .25,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/worker.jpg'),
                            fit: BoxFit.cover),
                        gradient: appBarGradient,
                        borderRadius: widget.isDraw
                            ? BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              )
                            : BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                      ),
                      //AppBar
                      child: Container(
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.6),
                          borderRadius: widget.isDraw
                              ? BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                )
                              : BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //Linha 01
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: widget.isDraw
                                    ? BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(100),
                                      )
                                    : BorderRadius.only(
                                        bottomRight: Radius.circular(100),
                                      ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  widget.isDraw
                                      ? InkWell(
                                          onTap: () {
                                            setState(() {
                                              widget.xOffset = 0;
                                              widget.yOffset = 0;
                                              widget.isDraw = false;
                                            });
                                          },
                                          child: Ink(
                                            height: 50,
                                            width: 80,
                                            child: Icon(
                                              Icons.arrow_back_ios,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            setState(() {
                                              widget.xOffset = Get.size.width -
                                                  Get.size.width * 0.1;
                                              widget.yOffset = 80;
                                              widget.isDraw = true;
                                            });
                                          },
                                          child: Ink(
                                            height: 50,
                                            width: 80,
                                            child: Icon(
                                              Icons.menu,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                  Text(
                                    '',
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //Linha 02
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: widget.isDraw
                                    ? BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(100),
                                      )
                                    : BorderRadius.only(
                                        bottomRight: Radius.circular(100),
                                      ),
                              ),
                              padding: EdgeInsets.only(left: 10, bottom: 20),
                              child: Row(
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'BEM-VINDO',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Container(
                                        width: Get.size.width - 10,
                                        padding: EdgeInsets.only(right: 10),
                                        child: Wrap(
                                          children: [
                                            Text(
                                              'Encontre o melhor profissional em toda a sua região!',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //Se foi feito pesquisa
                    isResearched
                        ? Expanded(
                            //Add um IgnoredPoint para bloquear o uso da Lista ao acessar o menu
                            child: IgnorePointer(
                              ignoring: widget.isDraw ? true : false,
                              child: Container(
                                height: Get.size.height,
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: SingleChildScrollView(
                                  physics: BouncingScrollPhysics(),
                                  child: Column(
                                    children: [
                                      //Campo de Pesquisa
                                      Container(
                                        height: 50,
                                        margin:
                                            EdgeInsets.symmetric(vertical: 10),
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        width: Get.size.width,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: TextFormField(
                                                controller:
                                                    encontrarProfissional,
                                                textAlignVertical:
                                                    TextAlignVertical.center,
                                                style: TextStyle(
                                                    color: primaryColor),
                                                decoration: InputDecoration(
                                                  suffix: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              primary:
                                                                  primaryColor),
                                                      onPressed: () async {
                                                        getData();
                                                        setState(() {
                                                          isResearched = true;
                                                        });
                                                      },
                                                      child: Text('Buscar')),
                                                  prefixIcon: Icon(
                                                    Icons.search,
                                                    size: 30,
                                                    color: primaryColor,
                                                  ),
                                                  hintText:
                                                      'Encontre Profissionais',
                                                  hintStyle: TextStyle(
                                                      color: primaryColor),
                                                  isDense: true,
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    borderSide: BorderSide(
                                                        color: primaryColor,
                                                        width: 1,
                                                        style:
                                                            BorderStyle.solid),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          borderSide: BorderSide(
                                                              color:
                                                                  primaryColor,
                                                              width: 1,
                                                              style: BorderStyle
                                                                  .solid)),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    borderSide: BorderSide(
                                                      color: primaryColor,
                                                      width: 2,
                                                      style: BorderStyle.solid,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  isResearched = false;
                                                  encontrarProfissional.clear();
                                                });
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(15),
                                                decoration: BoxDecoration(
                                                    color: primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Text(
                                                  'Voltar',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),

                                      Container(
                                        height: Get.size.height -
                                            Get.size.height * .4,
                                        child: FutureBuilder<List<ParseObject>>(
                                          future: getData(),
                                          builder: (context, snapshot) {
                                            switch (snapshot.connectionState) {
                                              case ConnectionState.waiting:
                                                return Center(
                                                  child: Container(
                                                      width: 100,
                                                      height: 100,
                                                      child:
                                                          CircularProgressIndicator()),
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
                                                      physics:
                                                          BouncingScrollPhysics(),
                                                      itemCount:
                                                          snapshot.data!.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        var subCategoria =
                                                            snapshot
                                                                .data![index];
                                                        var imgUrl = subCategoria
                                                            .get<ParseFileBase>(
                                                                'subCategoriaImg');
                                                        var nome = subCategoria
                                                            .get<String>(
                                                                'subCategoria');

                                                        return GestureDetector(
                                                          onTap: () {
                                                            Navigator.of(context).push(
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            ListaProfissionais(
                                                                              subcategoria: 'Pedreiro',
                                                                            )));
                                                          },
                                                          child: CategoriaTile(
                                                            imgUrl:
                                                                imgUrl!.url!,
                                                            categoria: nome!,
                                                            readme:
                                                                ', Ver Mais.',
                                                          ),
                                                        );
                                                      });
                                                }
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        :

                        //Corpo da Página
                        Expanded(
                            //Add um IgnoredPoint para bloquear o uso da Lista ao acessar o menu
                            child: IgnorePointer(
                              ignoring: widget.isDraw ? true : false,
                              child: Container(
                                height: Get.size.height,
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: SingleChildScrollView(
                                  physics: BouncingScrollPhysics(),
                                  child: Column(
                                    children: [
                                      //Campo de Pesquisa
                                      Container(
                                        height: 50,
                                        margin: EdgeInsets.only(top: 10),
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        width: Get.size.width,
                                        child: TextFormField(
                                          controller: encontrarProfissional,
                                          style: TextStyle(color: primaryColor),
                                          decoration: InputDecoration(
                                            suffix: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: primaryColor),
                                                onPressed: () async {
                                                  getData();
                                                  setState(() {
                                                    isResearched = true;
                                                  });
                                                },
                                                child: Text('Buscar')),
                                            prefixIcon: Icon(
                                              Icons.search,
                                              size: 30,
                                              color: primaryColor,
                                            ),
                                            hintText: 'Encontre Profissionais',
                                            hintStyle:
                                                TextStyle(color: primaryColor),
                                            isDense: true,
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              borderSide: BorderSide(
                                                  color: primaryColor,
                                                  width: 1,
                                                  style: BorderStyle.solid),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                borderSide: BorderSide(
                                                    color: primaryColor,
                                                    width: 1,
                                                    style: BorderStyle.solid)),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              borderSide: BorderSide(
                                                color: primaryColor,
                                                width: 2,
                                                style: BorderStyle.solid,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      //Serviços Populares
                                      Container(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              'Categorias Populares',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18,
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Future.delayed(Duration(
                                                        milliseconds: 100))
                                                    .then((value) {
                                                  setState(() {
                                                    stackOrder.clear();
                                                    stackOrder.add(WorkPage(
                                                      xOffset: 0,
                                                      yOffset: 0,
                                                      isDraw: false,
                                                    ));
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                InitScreen()));
                                                  });
                                                });
                                              },
                                              child: Text(
                                                'Ver Todos',
                                                style: TextStyle(
                                                    color: primaryColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      //Card Categorias
                                      Container(
                                        padding: EdgeInsets.only(right: 3),
                                        height: 130,
                                        child: FutureBuilder<List<ParseObject>>(
                                          future: getCategorias(),
                                          builder: (context, snapshot) {
                                            switch (snapshot.connectionState) {
                                              case ConnectionState.waiting:
                                                return Center(
                                                  child: Container(
                                                      width: 100,
                                                      height: 100,
                                                      child:
                                                          CircularProgressIndicator()),
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
                                                      physics:
                                                          BouncingScrollPhysics(),
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemCount:
                                                          snapshot.data!.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        var subCategoria =
                                                            snapshot
                                                                .data![index];
                                                        var imgUrl = subCategoria
                                                            .get<ParseFileBase>(
                                                                'img');
                                                        var nome = subCategoria
                                                            .get<String>(
                                                                'Categoria');

                                                        return GestureDetector(
                                                          onTap: () {
                                                            Navigator.of(context).push(
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            ListaProfissionais(
                                                                              subcategoria: 'Pedreiro',
                                                                            )));
                                                          },
                                                          child: ItemCategorias(
                                                            img: imgUrl!.url!,
                                                            nome: nome!,
                                                          ),
                                                        );
                                                      });
                                                }
                                            }
                                          },
                                        ),
                                      ),
                                      //Empresas Parceiras
                                      Container(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              'Empresas Parceiras',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18,
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              child: Text(
                                                'Ver Todas',
                                                style: TextStyle(
                                                    color: primaryColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      //Card Parceiros
                                      Container(
                                        height: 80,
                                        child: ListView.builder(
                                            physics: BouncingScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            itemCount: categorias.length,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                margin: EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: AssetImage(
                                                          'assets/parceira_01.png'),
                                                    ),
                                                    gradient: appBarGradient,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100)),
                                                height: 60,
                                                width: 70,
                                              );
                                            }),
                                      ),

                                      //Profissionais Destaques
                                      Container(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              'Profissionais em Destaque',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18,
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  Categorias newCategoria =
                                                      Categorias(
                                                          nome: 'Consultoria',
                                                          img:
                                                              'assets/parceira_01.png');
                                                  categorias.add(newCategoria);
                                                });
                                              },
                                              child: Text(
                                                'Ver Todos',
                                                style: TextStyle(
                                                    color: primaryColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      //Grid de Destaques
                                      Container(
                                        height: 220,
                                        child: FutureBuilder<List<ParseObject>>(
                                            future: getCategorias(),
                                            builder: (context, snapshot) {
                                              switch (
                                                  snapshot.connectionState) {
                                                case ConnectionState.waiting:
                                                  return Center(
                                                    child: Container(
                                                        width: 100,
                                                        height: 100,
                                                        child:
                                                            CircularProgressIndicator()),
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
                                                    return GridView.builder(
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      physics:
                                                          BouncingScrollPhysics(),
                                                      gridDelegate:
                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 2,
                                                        mainAxisSpacing: 10,
                                                        crossAxisSpacing: 10,
                                                        childAspectRatio:
                                                            9 / 11.5,
                                                      ),
                                                      itemCount:
                                                          snapshot.data!.length,
                                                      itemBuilder: (_, index) {
                                                        var subCategoria =
                                                            snapshot
                                                                .data![index];
                                                        var imgUrl = subCategoria
                                                            .get<ParseFileBase>(
                                                                'img');
                                                        var nome = subCategoria
                                                            .get<String>(
                                                                'Categoria');
                                                        return GestureDetector(
                                                          onTap: () {
                                                            //Chamar Tela do Profissional
                                                            showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) =>
                                                                        AlertDialog(
                                                                          content:
                                                                              Text('Informações'),
                                                                        ));
                                                          },
                                                          child: ItemCategorias(
                                                            nome: nome!,
                                                            img: imgUrl!.url!,
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  }
                                              }
                                            }),
                                      ),

                                      //Post's
                                      Container(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              'Dicas & Artigos',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      //Card Artigos
                                      Container(
                                        height: 80,
                                        child: ListView.builder(
                                            physics: BouncingScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            itemCount: categorias.length,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                margin: EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: primaryColor,
                                                        style:
                                                            BorderStyle.solid,
                                                        width: 1),
                                                    // color: primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100)),
                                                height: 60,
                                                width: 70,
                                                child: Icon(
                                                  Icons.tips_and_updates,
                                                  color: primaryColor,
                                                ),
                                              );
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<ParseObject>> getData() async {
    int last = encontrarProfissional.text.length;
    print(last);
    String espaco = encontrarProfissional.text.substring(last - 1, last);

    if (espaco == ' ') {
      encontrarProfissional.text =
          encontrarProfissional.text.substring(0, last - 1);
    }
    QueryBuilder<ParseObject> queryRead =
        QueryBuilder<ParseObject>(ParseObject('Categorias'));
    queryRead..whereContains('subCategoria', encontrarProfissional.text);

    final ParseResponse apiResponse = await queryRead.query();

    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }

  Future<List<ParseObject>> getCategorias() async {
    QueryBuilder<ParseObject> queryRead =
        QueryBuilder<ParseObject>(ParseObject('NomesCategorias'));

    final ParseResponse apiResponse = await queryRead.query();
    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }
}
