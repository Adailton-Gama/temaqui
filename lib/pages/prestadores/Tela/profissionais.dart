import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:temaqui/data/back4app.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../data/config.dart';

class Profissional extends StatefulWidget {
  const Profissional({Key? key}) : super(key: key);

  @override
  State<Profissional> createState() => _ProfissionalState();
}

class _ProfissionalState extends State<Profissional> {
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
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      width: Get.size.width,
                      padding: EdgeInsets.only(
                          left: 20, top: 20, bottom: 20, right: 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  height: 50,
                  width: Get.size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
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
                            GestureDetector(
                              onTap: () {
                                _launcheInApp('https://wa.me/5574999703600');
                              },
                              child: Column(
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
                            ),
                            GestureDetector(
                              onTap: () {
                                _launcheInApp(
                                    'https://www.instagram.com/al_infortec/');
                              },
                              child: Column(
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
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                          height: 2,
                          width: Get.size.width * .75,
                          color: Colors.grey[300],
                        ),
                        Text(
                          'Visite-nos:',
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          height: 200,
                          width: Get.size.width,
                          child: GoogleMap(
                            initialCameraPosition: CameraPosition(
                              target: LatLng(
                                  -10.665531157927147, -39.501185466475086),
                              zoom: 19,
                            ),
                            zoomControlsEnabled: false,
                            markers: <Marker>{
                              Marker(
                                markerId: MarkerId('Abraão Lucas'),
                                infoWindow: InfoWindow(
                                    title: 'Abraão',
                                    onTap: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text('asdas'),
                                        ),
                                      );
                                    }),
                                position: LatLng(
                                    -10.665531157927147, -39.501185466475086),
                                icon: BitmapDescriptor.defaultMarkerWithHue(
                                    BitmapDescriptor.hueViolet),
                              ),
                            },
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: secundaryColor),
                            onPressed: () {},
                            child: Text(
                              'Entrar em Contato!',
                              style: TextStyle(color: Colors.black),
                            )),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launcheInApp(String url) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }
}
