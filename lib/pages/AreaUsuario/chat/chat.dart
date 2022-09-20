import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:temaqui/data/config.dart';

import 'DetailsChat.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var chatDocId;
  CollectionReference chat = FirebaseFirestore.instance.collection('Mensagens');
  String nome = '';
  var refChats = FirebaseFirestore.instance
      .collection('Usuarios')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('conversas');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List conversas = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Mensagens',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w300,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(gradient: appBarGradient),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, left: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      decoration: InputDecoration(
                        hintText: 'Buscar Conversa',
                        hintStyle: TextStyle(color: Colors.white),
                        isDense: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2,
                            style: BorderStyle.solid,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2,
                            style: BorderStyle.solid,
                          ),
                        ),
                        prefixIcon: Icon(
                          size: 30,
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: secundaryColor,
                          content: Text(
                            'Buscando Conversa...',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: primaryColor),
                          ),
                        ),
                      );
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(
                        size: 30,
                        Icons.search,
                        color: primaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                height: 20,
                width: Get.size.width,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 100),
                      blurRadius: 3,
                      spreadRadius: 2,
                      blurStyle: BlurStyle.normal,
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: [
                    StreamBuilder(
                        stream: refChats.snapshots(),
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
                                    var id = documentSnapshot['de'];
                                    if (documentSnapshot.id !=
                                        FirebaseAuth
                                            .instance.currentUser!.uid) {
                                      return GestureDetector(
                                        onTap: () {
                                          teste(id);
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailsChat(
                                                        idMessage:
                                                            documentSnapshot[
                                                                    'id']
                                                                .toString(),
                                                        de: documentSnapshot[
                                                            'uid'],
                                                        foto: documentSnapshot[
                                                            'foto'],
                                                        nome: documentSnapshot[
                                                            'remetente'],
                                                      )));
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(bottom: 10),
                                          padding: EdgeInsets.only(
                                              right: 20, top: 5, bottom: 5),
                                          height: 80,
                                          width: Get.size.width,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 235),
                                                blurRadius: 3,
                                                spreadRadius: 2,
                                                blurStyle: BlurStyle.normal,
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 60,
                                                width: 60,
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        documentSnapshot[
                                                            'foto']),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  padding:
                                                      EdgeInsets.only(left: 10),
                                                  width: Get.size.width / 1.8,
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    documentSnapshot[
                                                        'remetente'],
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                ),
                                              ),
                                              // Column(
                                              //   children: [
                                              //     Container(
                                              //       alignment: Alignment.center,
                                              //       height: 25,
                                              //       width: 25,
                                              //       margin: EdgeInsets.only(
                                              //           top: 10, bottom: 10),
                                              //       decoration: BoxDecoration(
                                              //         color: primaryColor,
                                              //         borderRadius:
                                              //             BorderRadius.circular(
                                              //                 100),
                                              //       ),
                                              //       child: Text(
                                              //         '}',
                                              //         style: TextStyle(
                                              //             color: Colors.white),
                                              //       ),
                                              //     ),
                                              //     Text('00:00')
                                              //   ],
                                              // ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }
                                    return Center();
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

  void getData() {
    refChats.get().then((value) {
      value.docs.forEach((element) {
        if (element['de'] == FirebaseAuth.instance.currentUser!.uid ||
            element['id'] == FirebaseAuth.instance.currentUser!.uid) {
          value;
        }
      });
    });
  }

  String buscarNome(String id) {
    var ref = FirebaseFirestore.instance.collection('Usuarios').doc(id);
    ref.get().then((value) {
      nome = value['nome'];
    });
    return nome;
  }

  void teste(String friendUid) {
    String friend = friendUid;
    String me = FirebaseAuth.instance.currentUser!.uid;

    chat
        .where('users', isEqualTo: {'friend': friendUid, 'me': me})
        .limit(1)
        .get()
        .then((QuerySnapshot querySnapshot) {
          if (querySnapshot.docs.isNotEmpty) {
            chatDocId = querySnapshot.docs.single.id;
          } else {
            chat.add({
              'users': {
                'me': me,
                'friend': friend,
              }
            }).then((value) => {chatDocId = value});
          }
        })
        .catchError((error) {});
  }
}
