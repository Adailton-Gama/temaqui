import 'package:flutter/material.dart';
import 'package:temaqui/data/data.dart';

import '../pages/home/Home_Screen.dart';

Color primaryColor = Color.fromRGBO(81, 37, 227, 1);
Color secundaryColor = Color.fromRGBO(255, 204, 41, 1);
Color bkColor = Color.fromRGBO(116, 46, 145, 1);

List<Widget> stackOrder = [HomeScreen()];
List<Categorias> categoria = [];

Planos bronze =
    Planos(nome: 'Bronze', descricao: 'Este é o Plano Bronze', preco: 10);
Planos prata =
    Planos(nome: 'Prata', descricao: 'Este é o Plano Prata', preco: 20);
Planos ouro = Planos(nome: 'Ouro', descricao: 'Este é o Plano Ouro', preco: 30);
