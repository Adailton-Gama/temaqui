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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://blog.ead.unipar.br/wp-content/uploads/2021/04/inovacao-e-tecnologia.jpg'),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, top: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                          child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                  height: 50,
                  width: Get.size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        width: Get.size.width,
                        margin: EdgeInsets.only(bottom: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 3,
                                    spreadRadius: 2,
                                    blurStyle: BlurStyle.normal,
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Abraão Lucas'.toUpperCase(),
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  height: 2,
                                  width: Get.size.width * .75,
                                  color: Colors.grey[300],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Avaliações:',
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 20,
                                      color: secundaryColor,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 20,
                                      color: secundaryColor,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 20,
                                      color: secundaryColor,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 20,
                                      color: secundaryColor,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 20,
                                      color: secundaryColor,
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Text(
                        'Profissão',
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('data ' * 20),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        height: 2,
                        width: Get.size.width * .75,
                        color: Colors.grey[300],
                      ),
                      Text(
                        'Redes Sociais',
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 50,
                                child: Image.network(
                                  'https://www.ufpb.br/ufpb/icons/redes-sociais/whatsapp.png/@@images/f903d7ef-3419-4ecf-a375-67f23c374a30.png',
                                  filterQuality: FilterQuality.medium,
                                ),
                              ),
                              Text('(74) 99999-9999'),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 50,
                                child: Image.network(
                                  'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/2048px-Instagram_icon.png',
                                  filterQuality: FilterQuality.medium,
                                ),
                              ),
                              Text('@abraao.lucas'),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 50,
                                child: Image.network(
                                  'https://cdn-icons-png.flaticon.com/512/1384/1384060.png',
                                  filterQuality: FilterQuality.medium,
                                ),
                              ),
                              Text('Canal do Abraão'),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
