import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
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
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ListaProfissionais()));
                },
                child: CategoriaTile(
                  imgUrl: (widget.categoria.img),
                  categoria: widget.categoria.nome,
                  descricao:
                      'Nesta Seção você verá as seguintes profissões: Profissão 01, Profissão 02, Profissão 03',
                  readme: ', Ver Mais.',
                ),
              ),
              CategoriaTile(
                imgUrl: (widget.categoria.img),
                categoria: widget.categoria.nome,
                descricao:
                    'Nesta Seção você verá as seguintes profissões: Profissão 01, Profissão 02, Profissão 03',
                readme: ', Ver Mais.',
              ),
              CategoriaTile(
                imgUrl: (widget.categoria.img),
                categoria: widget.categoria.nome,
                descricao:
                    'Nesta Seção você verá as seguintes profissões: Profissão 01, Profissão 02, Profissão 03',
                readme: ', Ver Mais.',
              ),
              CategoriaTile(
                imgUrl: (widget.categoria.img),
                categoria: widget.categoria.nome,
                descricao:
                    'Nesta Seção você verá as seguintes profissões: Profissão 01, Profissão 02, Profissão 03',
                readme: ', Ver Mais.',
              ),
              CategoriaTile(
                imgUrl: (widget.categoria.img),
                categoria: widget.categoria.nome,
                descricao:
                    'Nesta Seção você verá as seguintes profissões: Profissão 01, Profissão 02, Profissão 03',
                readme: ', Ver Mais.',
              ),
              CategoriaTile(
                imgUrl: (widget.categoria.img),
                categoria: widget.categoria.nome,
                descricao:
                    'Nesta Seção você verá as seguintes profissões: Profissão 01, Profissão 02, Profissão 03',
                readme: ', Ver Mais.',
              ),
              CategoriaTile(
                imgUrl: (widget.categoria.img),
                categoria: widget.categoria.nome,
                descricao:
                    'Nesta Seção você verá as seguintes profissões: Profissão 01, Profissão 02, Profissão 03',
                readme: ', Ver Mais.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
