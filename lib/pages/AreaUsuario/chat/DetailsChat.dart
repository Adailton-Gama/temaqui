import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../data/config.dart';

class DetailsChat extends StatefulWidget {
  DetailsChat({
    Key? key,
    required this.idMessage,
    required this.foto,
    required this.nome,
    required this.de,
  }) : super(key: key);
  String idMessage;
  String de;
  String nome = '';
  String foto = '';
  @override
  State<DetailsChat> createState() => _DetailsChatState();
}

class _DetailsChatState extends State<DetailsChat> {
  TextEditingController controllerMensagem = TextEditingController();
  Map mensagens = {};
  String myfoto = '';
  Timer? timer;
  void RefreshData() async {
    timer = new Timer.periodic(Duration(seconds: 1), (timer) {
      getMens();
      print('atualizando');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    RefreshData();
    getMens();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (timer != null) {
      timer!.cancel();
    }
    print('Atualização encerrada!');
    super.dispose();
  }

  Widget build(BuildContext context) {
    CollectionReference colRef = FirebaseFirestore.instance
        .collection('Usuarios')
        .doc('conversas')
        .collection(widget.idMessage);
    bool isComposing = false;
    String me = '';
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //Topo
              Container(
                decoration: BoxDecoration(
                  gradient: appBarGradient,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35)),
                ),
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 180),
                              blurRadius: 2,
                              spreadRadius: 3,
                              blurStyle: BlurStyle.normal)
                        ],
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                          image: NetworkImage(widget.foto),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      width: Get.size.width / 1.8,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            widget.nome,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 200),
                                blurRadius: 2,
                                spreadRadius: 3,
                                blurStyle: BlurStyle.normal)
                          ],
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.grey[300],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 6,
                              width: 6,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 6,
                              width: 6,
                              margin: EdgeInsets.only(left: 3, right: 3),
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 6,
                              width: 6,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //Corpo
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  height: 10,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: mensagens.length,
                    itemBuilder: ((context, index) {
                      me = mensagens[index]['de'];

                      return Container(
                        padding: EdgeInsets.all(15),
                        margin: me == FirebaseAuth.instance.currentUser!.uid
                            ? EdgeInsets.only(left: 50, top: 10)
                            : EdgeInsets.only(right: 50, top: 10),
                        decoration: BoxDecoration(
                          color: me == FirebaseAuth.instance.currentUser!.uid
                              ? Color.fromRGBO(140, 22, 186, 1)
                              : Colors.grey[300],
                          borderRadius:
                              me == FirebaseAuth.instance.currentUser!.uid
                                  ? BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                      bottomLeft: Radius.circular(30))
                                  : BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                      bottomRight: Radius.circular(30)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              mensagens[index]['text'],
                              textAlign: TextAlign.justify,
                            ),
                            me == FirebaseAuth.instance.currentUser!.uid
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        mensagens[index]['time'],
                                        textAlign: TextAlign.right,
                                      ),
                                      Icon(Icons.check),
                                    ],
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.check),
                                      Text(
                                        mensagens[index]['time'],
                                        textAlign: TextAlign.right,
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ),
              Container(
                height: 60,
                margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                padding: EdgeInsets.all(10),
                width: Get.size.width,
                decoration: BoxDecoration(
                  gradient: buttonGradient,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 200),
                        blurRadius: 2,
                        spreadRadius: 3,
                        blurStyle: BlurStyle.normal)
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controllerMensagem,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Escreva sua mensagem...',
                          hintStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none,
                        ),
                        onEditingComplete: enviarMensagem,
                      ),
                    ),
                    GestureDetector(
                      onTap: enviarMensagem,
                      child: Container(
                        height: 40,
                        width: 40,
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getMens() async {
    // var name = FirebaseFirestore.instance
    //     .collection('Usuarios')
    //     .doc(widget.idMessage.replaceAll(' ', ''))
    //     .get()
    //     .then((value) {
    //   setState(() {
    //     nome = value['nome'];
    //     foto = value['foto'];
    //   });
    // });

    final result = await FirebaseFirestore.instance
        .collection('Mensagens')
        .doc(widget.idMessage.replaceAll(' ', ''))
        .collection('conversa')
        .orderBy('time')
        .get();
    setState(() {
      mensagens = result.docs.asMap();
    });
  }

  void enviarMensagem() async {
    FirebaseFirestore.instance
        .collection('Usuarios')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      setState(() {
        myfoto = value['foto'];

        FirebaseFirestore.instance
            .collection('Usuarios')
            .doc(widget.de.replaceAll(' ', ''))
            .collection('conversas')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .set({
          'id': widget.idMessage,
          'remetente': value['nome'],
          'para': widget.de,
          'foto': value['foto'],
          'de': FirebaseAuth.instance.currentUser!.uid
        });
      });
      FirebaseFirestore.instance
          .collection('Usuarios')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('conversas')
          .doc(widget.de.replaceAll(' ', ''))
          .set({
        'id': widget.idMessage,
        'remetente': value['nome'],
        'para': widget.de,
        'foto': value['foto'],
        'de': FirebaseAuth.instance.currentUser!.uid
      });
    });
    //
    //
    //

    final send = await FirebaseFirestore.instance
        .collection('Mensagens')
        .doc(widget.idMessage.replaceAll(' ', ''));
    send.collection('conversa').add({
      'de': FirebaseAuth.instance.currentUser!.uid,
      'text': controllerMensagem.text,
      'para': widget.de,
      'time': DateFormat('d/MM/yyyy - HH:mm:s').format(DateTime.now()),
    });
    print(widget.de);
    setState(() {
      controllerMensagem.clear();
    });
    // ScaffoldMessenger.of(context).clearSnackBars();
    // ScaffoldMessenger.of(context)
    //     .showSnackBar(SnackBar(content: Text(controllerMensagem.text)));
    FocusScope.of(context).unfocus();
    getMens();
  }
}

// De: 
// Para:
// Mensagem:
// Time:
