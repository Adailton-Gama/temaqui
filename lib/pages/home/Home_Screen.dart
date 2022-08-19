import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:temaqui/data/config.dart';
import 'package:temaqui/data/data.dart';
import 'package:temaqui/pages/commons/Item_Categorias.dart';

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
  @override
  bool isDrawerOpen = false;
  List<Categorias> categorias = [];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var heigthbar = AppBar().preferredSize.height;
    var padding = MediaQuery.of(context).padding;
    return SafeArea(
      child: AnimatedContainer(
        height: Get.size.height,
        width: Get.size.width,
        transform: Matrix4.translationValues(widget.xOffset, widget.yOffset, 0)
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
                ? BoxShadow(color: Colors.grey, blurRadius: 5, spreadRadius: 2)
                : BoxShadow()
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
                child: SingleChildScrollView(
              physics: widget.isDraw
                  ? NeverScrollableScrollPhysics()
                  : BouncingScrollPhysics(),
              child: Container(
                height: Get.size.height + Get.size.height * 0.3,
                child: Column(
                  children: [
                    //AppBar
                    Container(
                      height: Get.size.height * .3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/worker.jpg'),
                            fit: BoxFit.cover),
                        color: Color.fromRGBO(81, 39, 227, 1),
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
                      //AppBar
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(81, 39, 227, 0.5),
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //Linha 01
                            Container(
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
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //Linha 02
                            Container(
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

                    //Corpo da Página

                    Expanded(
                      //Add um IgnoredPoint para bloquear o uso da Lista ao acessar o menu
                      child: IgnorePointer(
                        ignoring: widget.isDraw ? true : false,
                        child: Container(
                          height: Get.size.height,
                          padding: EdgeInsets.all(5),
                          child: Column(
                            children: [
                              //Campo de Pesquisa
                              Container(
                                height: 50,
                                margin: EdgeInsets.symmetric(vertical: 10),
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                width: Get.size.width,
                                child: TextFormField(
                                  style: TextStyle(color: primaryColor),
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.search,
                                      size: 30,
                                      color: primaryColor,
                                    ),
                                    hintText: 'Encontre Profissionais',
                                    hintStyle: TextStyle(color: primaryColor),
                                    isDense: true,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: primaryColor,
                                          width: 1,
                                          style: BorderStyle.solid),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                            color: primaryColor,
                                            width: 1,
                                            style: BorderStyle.solid)),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
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
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Serviços Populares',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          Categorias newCategoria = Categorias(
                                              nome: 'Consultoria',
                                              img: 'assets/01_Consultoria.png');
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
                              //Card Categorias
                              Container(
                                height: 200,
                                child: ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: categorias.length,
                                    itemBuilder: (context, index) {
                                      return ItemCategorias(
                                        nome: categorias[index].nome,
                                        img: categorias[index].img,
                                      );
                                    }),
                              ),

                              //Profissionais Destaques
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Profissionais Destaques',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
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
                              Expanded(
                                child: GridView.builder(
                                  padding: EdgeInsets.all(10),
                                  physics: BouncingScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    childAspectRatio: 9 / 11.5,
                                  ),
                                  itemCount: categorias.length,
                                  itemBuilder: (_, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        //Chamar Tela do Profissional
                                        showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                  content: Text('Informações'),
                                                ));
                                      },
                                      child: ItemCategorias(
                                        nome: categorias[index].nome,
                                        img: categorias[index].img,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
