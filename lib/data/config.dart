import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temaqui/data/data.dart';

import '../pages/home/Home_Screen.dart';

Color primaryColor = Color.fromRGBO(115, 50, 142, 1);
Color secundaryColor = Color.fromRGBO(255, 204, 41, 1);
Color bkColor = Color.fromRGBO(81, 37, 227, 1);

List<Widget> stackOrder = [HomeScreen()];

Planos bronze =
    Planos(nome: 'Bronze', descricao: 'Este é o Plano Bronze', preco: 10);
Planos prata =
    Planos(nome: 'Prata', descricao: 'Este é o Plano Prata', preco: 20);
Planos ouro = Planos(nome: 'Ouro', descricao: 'Este é o Plano Ouro', preco: 30);

LinearGradient appBarGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: [
    0,
    0.3,
    0.5,
    1,
  ],
  colors: [
    Color.fromRGBO(94, 21, 187, 1),
    Color.fromRGBO(121, 23, 188, 1),
    Color.fromRGBO(121, 23, 188, 1),
    Color.fromRGBO(142, 22, 186, 1),
  ],
);
//
//
LinearGradient buttonGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: [
    0,
    0.2,
    0.5,
    0.9,
    1,
  ],
  colors: [
    Color.fromRGBO(94, 21, 187, 1),
    Color.fromRGBO(121, 23, 188, 1),
    Color.fromRGBO(142, 22, 186, 1),
    Color.fromRGBO(94, 21, 187, 1),
    Color.fromRGBO(121, 23, 188, 1),
  ],
);

class GetSizeKeyboard extends GetxController {
  var keyboardSize = 0.obs;
  void ChangeValue() => keyboardSize.value;
}
