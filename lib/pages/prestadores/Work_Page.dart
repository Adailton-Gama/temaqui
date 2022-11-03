import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:temaqui/pages/commons/CategoriaTile.dart';
import 'package:temaqui/pages/commons/Normal_Buttom.dart';
import 'package:temaqui/pages/prestadores/Tela/subCategorias.dart';

import '../../data/config.dart';
import '../../data/data.dart';

class WorkPage extends StatefulWidget {
  WorkPage(
      {Key? key, this.isDraw = false, this.xOffset = 290, this.yOffset = 80})
      : super(key: key);
  bool isDraw;
  double xOffset;
  double yOffset;
  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  final CollectionReference refCat =
      FirebaseFirestore.instance.collection('Categorias');
  double xOffset = 290;
  double yOffset = 80;
  Categorias cat01 = Categorias(
      nome: 'Consultoria',
      img:
          'https://media.istockphoto.com/id/1369199360/pt/foto/portrait-of-a-handsome-young-businessman-working-in-office.webp?s=612x612&w=is&k=20&c=Jk_8v5CkSDS_eYpNEeoVCdSIMq8m56rPTQ85ymmbX-Y=');
  Categorias cat02 = Categorias(
      nome: 'Moda e Beleza',
      img:
          'https://www.bcpp.org/wp-content/uploads/2021/07/Hair-Salon-women-of-color.png');
  Categorias cat03 = Categorias(
      nome: 'Reforma e Reparo',
      img:
          'https://img.freepik.com/free-photo/muscular-car-service-worker-repairing-vehicle_146671-19605.jpg');
  Categorias cat04 = Categorias(
      nome: 'Assistência Técnica',
      img:
          'https://www.lojassantaifigenia.com.br/blog/wp-content/uploads/2019/02/como-escolher-a-melhor-assist%C3%AAncia-t%C3%A9cnica-CORPO-1.jpg');
  List<Categorias> categoria = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoria.add(cat01);
    categoria.add(cat02);
    categoria.add(cat03);
    categoria.add(cat04);
    categoria.add(cat01);
    categoria.add(cat02);
    categoria.add(cat03);
    categoria.add(cat04);
  }

  @override
  Widget build(BuildContext context) {
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
          transform:
              Matrix4.translationValues(widget.xOffset, widget.yOffset, 0)
                ..scale(widget.isDraw ? 0.85 : 1.00)
                ..rotateZ(widget.isDraw ? -50 : 0),
          duration: const Duration(milliseconds: 500),
          child: Column(
            children: <Widget>[
              //AppBar
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: primaryColor,
                  image: DecorationImage(
                    opacity: 1,
                    image: AssetImage('assets/new_banner.png'),
                    fit: BoxFit.cover,
                  ),
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
                  child: Column(
                    children: [
                      //Linha 01
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              'CATEGORIAS',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
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
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Row(
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '',
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //Corpo da Tela
              Expanded(
                child: IgnorePointer(
                  ignoring: widget.isDraw ? true : false,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: widget.isDraw
                          ? const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            )
                          : BorderRadius.circular(0),
                      color: Colors.white,
                    ),
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
                                                      SubCategorias(
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
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
    });
  }
}
