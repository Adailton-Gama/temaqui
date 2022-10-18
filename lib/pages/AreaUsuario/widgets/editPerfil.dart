import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:temaqui/data/config.dart';
import '../../../data/config.dart' as config;
import '../../../data/data.dart';
import '../../commons/Normal_Buttom.dart';
import '../../commons/TextForm.dart';
import '../../login/nova_conta/commons/escolherCategoria.dart';

class EditPerfil extends StatefulWidget {
  String usuario;

  EditPerfil({
    Key? key,
    required this.usuario,
  }) : super(key: key);

  @override
  State<EditPerfil> createState() => _EditPerfilState();
}

class _EditPerfilState extends State<EditPerfil> {
  final CollectionReference refCat =
      FirebaseFirestore.instance.collection('Categorias');
  //
  //
  final MaskTextInputFormatter normal = MaskTextInputFormatter(mask: '');
  final MaskTextInputFormatter cpfmask =
      MaskTextInputFormatter(mask: '###.###.###-##');
  final MaskTextInputFormatter telmask =
      MaskTextInputFormatter(mask: '(##) # ####-####');
  final MaskTextInputFormatter datemask =
      MaskTextInputFormatter(mask: "##/##/####");

  //
  //
  TextEditingController _nome = TextEditingController();
  TextEditingController _usuario = TextEditingController();
  TextEditingController _senha = TextEditingController();
  TextEditingController _telefone = TextEditingController();
  TextEditingController _cpf = TextEditingController();
  TextEditingController _endereco = TextEditingController();
  TextEditingController _profissao = TextEditingController();
  TextEditingController _dtnascimento = TextEditingController();
  String _foto = '';
  String categoria = '';
  List subcategoria = [];
  String subcategoriaStr = '';
  TextEditingController _datadeNascimento = TextEditingController();
  //
  //
  PickedFile? foto;
  String fotoLocal =
      'https://firebasestorage.googleapis.com/v0/b/temaqui-1d3cb.appspot.com/o/add_foto.png?alt=media&token=0a781fd7-fe9a-489e-b2a6-10eb54e0c03d';
  //
  //
  String selectedPlano =
      '${config.bronze.nome}    -    R\$ ${config.bronze.preco.toStringAsFixed(2)}';
  List<Planos> planos = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDados();
    if (categoria.isEmpty) {
      setState(() {
        categoria = 'Selecione a Categoria';
      });
    }
    if (subcategoriaStr.isEmpty) {
      setState(() {
        subcategoriaStr = 'Selecione a Categoria';
      });
    }
    planos.add(config.bronze);
    planos.add(config.prata);
    planos.add(config.ouro);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: primaryColor),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
          child: Column(
            children: [
              GestureDetector(
                onTap: () async {
                  final storage = FirebaseStorage.instance;

                  var ref = FirebaseFirestore.instance
                      .collection('Usuarios')
                      .doc(widget.usuario);

                  PickedFile? fotoPerfil =
                      await ImagePicker().getImage(source: ImageSource.gallery);
                  var file = File(fotoPerfil!.path);
                  var cadFoto = await storage
                      .ref()
                      .child('usuarios/${widget.usuario}/foto/perfil/')
                      .putFile(file);
                  //
                  var imgUrl = await cadFoto.ref.getDownloadURL();
                  //
                  ref.update({
                    'foto': imgUrl,
                  });
                  //
                  setState(() {
                    fotoLocal = imgUrl;
                  });
                  //
                },
                child: Container(
                  height: 100,
                  width: 100,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image: _foto.isNotEmpty
                          ? NetworkImage(_foto)
                          : NetworkImage(
                              fotoLocal,
                            ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Para Acesso ao App:',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              CustomTextForm(
                padding: 10,
                userControler: _usuario,
                label: 'E-mail',
                mask: normal,
                validacao: () {
                  if (_endereco.text == null || _endereco.text.isEmpty) {
                    return 'Favor Preencher Campo';
                  }
                },
              ),
              CustomTextForm(
                padding: 10,
                userControler: _senha,
                label: 'Senha',
                mask: normal,
                validacao: () {
                  if (_endereco.text == null || _endereco.text.isEmpty) {
                    return 'Favor Preencher Campo';
                  }
                },
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Dados Pessoais:',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              CustomTextForm(
                padding: 10,
                userControler: _nome,
                label: 'Nome Completo',
                mask: normal,
                validacao: () {
                  if (_endereco.text == null || _endereco.text.isEmpty) {
                    return 'Favor Preencher Campo';
                  }
                },
              ),
              CustomTextForm(
                padding: 10,
                userControler: _telefone,
                label: 'Telefone',
                mask: telmask,
                type: TextInputType.numberWithOptions(),
                validacao: () {
                  if (_endereco.text == null || _endereco.text.isEmpty) {
                    return 'Favor Preencher Campo';
                  }
                },
              ),
              CustomTextForm(
                padding: 10,
                userControler: _cpf,
                label: 'CPF',
                mask: cpfmask,
                type: TextInputType.numberWithOptions(),
                validacao: () {
                  if (_endereco.text == null || _endereco.text.isEmpty) {
                    return 'Favor Preencher Campo';
                  }
                },
              ),
              CustomTextForm(
                padding: 10,
                userControler: _endereco,
                label: 'Endereço',
                mask: normal,
                validacao: () {
                  if (_endereco.text == null || _endereco.text.isEmpty) {
                    return 'Favor Preencher Campo';
                  }
                },
              ),
              CustomTextForm(
                padding: 5,
                userControler: _dtnascimento,
                label: 'Data de Nascimento',
                mask: datemask,
                type: TextInputType.numberWithOptions(),
                acao: TextInputAction.next,
                validacao: () {
                  if (_endereco.text == null || _endereco.text.isEmpty) {
                    return 'Favor Preencher Campo';
                  }
                },
              ),
              //Para Profissionais
              _profissao.text == 'profissional'
                  ? Column(
                      children: [
//
                        //Profissão
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                'Dados da Profissão:',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            //
                            //Categoria
                            InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          content: StreamBuilder(
                                              stream: refCat.snapshots(),
                                              builder: (context,
                                                  AsyncSnapshot<QuerySnapshot>
                                                      snapshot) {
                                                if (snapshot.hasData) {
                                                  return Container(
                                                    height: 200,
                                                    child: ListView.builder(
                                                      itemCount: snapshot
                                                          .data!.docs.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        final DocumentSnapshot
                                                            documentSnapshot =
                                                            snapshot.data!
                                                                .docs[index];
                                                        return GestureDetector(
                                                          onTap: () =>
                                                              selecionarCategoria(
                                                                  documentSnapshot
                                                                      .id),
                                                          child: Container(
                                                            margin: EdgeInsets
                                                                .fromLTRB(
                                                                    0, 5, 0, 0),
                                                            padding: EdgeInsets
                                                                .fromLTRB(5, 10,
                                                                    5, 10),
                                                            decoration: BoxDecoration(
                                                                color:
                                                                    primaryColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20)),
                                                            child: Text(
                                                              '${documentSnapshot['Categoria'].toString()}',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  );
                                                } else if (snapshot.hasError) {
                                                  return Text(
                                                    'Erro ao Carregar dados!',
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  );
                                                }

                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              }),
                                        ));
                              },
                              child: Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.all(10),
                                height: 50,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: primaryColor, width: 2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      categoria.isEmpty
                                          ? 'Selecione a Categoria'
                                          : categoria,
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    Icon(
                                      Icons.menu,
                                      color: primaryColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            ///
                            SizedBox(height: 5),
                            //
                            //SubCategoria
                            InkWell(
                              onTap: () {
                                getSubcategoria(categoria);
                                Future.delayed(Duration(milliseconds: 500))
                                    .then((value) => {
                                          showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              content: ListView.builder(
                                                shrinkWrap: true,
                                                itemCount: subcategoria.length,
                                                itemBuilder: (context, index) {
                                                  return ListTile(
                                                    leading: CircleAvatar(
                                                      backgroundImage:
                                                          NetworkImage(
                                                              subcategoria[
                                                                          index]
                                                                      ['catImg']
                                                                  .toString()),
                                                    ),
                                                    title: Text(
                                                        subcategoria[index]
                                                                ['SubCategoria']
                                                            .toString()),
                                                    onTap: () {
                                                      setState(() {
                                                        subcategoriaStr =
                                                            subcategoria[index][
                                                                    'SubCategoria']
                                                                .toString();
                                                      });
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        });
                              },
                              child: Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.all(10),
                                height: 50,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: primaryColor, width: 2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      subcategoriaStr.isEmpty
                                          ? 'Selecione a SubCategoria'
                                          : subcategoriaStr,
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    Icon(
                                      Icons.menu,
                                      color: primaryColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        //
                        //Planos

                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                'Planos:',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            content: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                //
                                                Text(
                                                  'Escolha o plano desejado:',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                //
                                                Container(
                                                  padding:
                                                      EdgeInsets.only(top: 10),
                                                  height: Get.size.height / 2.3,
                                                  child: ListView.builder(
                                                      itemCount: planos.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              selectedPlano =
                                                                  '${planos[index].nome}    -    R\$ ${planos[index].preco.toStringAsFixed(2)}';
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            });
                                                          },
                                                          child:
                                                              EscolherCategoria(
                                                            nome: planos[index]
                                                                .nome,
                                                            descricao:
                                                                planos[index]
                                                                    .descricao,
                                                            preco: planos[index]
                                                                .preco,
                                                          ),
                                                        );
                                                      }),
                                                ),
                                              ],
                                            ),
                                          ));
                                },
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.all(10),
                                  height: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: primaryColor, width: 2),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        selectedPlano,
                                        style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Icon(
                                        Icons.menu,
                                        color: primaryColor,
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ],
                    )
                  : Column(),
              SizedBox(
                height: 10,
              ),
              Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  onTap: () async {
                    try {
                      if (_nome.text != null &&
                          _usuario.text != null &&
                          _senha.text != null &&
                          _telefone.text != null &&
                          _cpf.text != null &&
                          _endereco.text != null &&
                          _dtnascimento.text != null) {
                        FirebaseFirestore.instance
                            .collection('Usuarios')
                            .doc(widget.usuario.toString())
                            .update({
                          'nome': _nome.text,
                          'email': _usuario.text,
                          'senha': _senha.text,
                          'telefone': _telefone.text,
                          'cpf': _cpf.text,
                          'endereco': _endereco.text,
                          'nascimento': _dtnascimento.text,
                          'categoria': categoria.toString(),
                          'subcategoria': subcategoriaStr.toString(),
                          'plano': selectedPlano,
                        });
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.green,
                            content: Text(
                                'Usuário: ${_nome.text} Atualizado com sucesso!')));
                      }
                    } on FirebaseException catch (e) {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            'Error ao se cadastrar\nVerifique se todos os campos estão preenchidos!',
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          )));
                    }
                  },
                  child: Ink(
                    child: NormalButtom(
                        color: secundaryColor,
                        labelColor: Colors.white,
                        label: 'Atualizar',
                        width: Get.size.width),
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
      setState(() {
        categoria = data['Categoria'].toString();
      });
      Navigator.pop(context);
    });
  }

  void getSubcategoria(String categoria) async {
    final result = await FirebaseFirestore.instance
        .collection('Subcategorias')
        .where('Categoria', isEqualTo: categoria)
        .get();
    setState(() {
      subcategoria = result.docs.map((e) => e.data()).toList();
    });
  }

  void getDados() {
    var ref = FirebaseFirestore.instance
        .collection('Usuarios')
        .doc(widget.usuario)
        .get();
    ref.then((value) {
      setState(() {
        //
        _foto = value['foto'];
        _usuario.text = value['email'];
        _senha.text = value['senha'];
        _nome.text = value['nome'];
        _telefone.text = value['telefone'];
        _cpf.text = value['cpf'];
        _endereco.text = value['endereco'];
        selectedPlano = value['plano'];
        categoria = value['categoria'];
        subcategoriaStr = value['subcategoria'];
        _profissao.text = value['nivel'];
        _dtnascimento.text = value['nascimento'];
      });
    });
  }
}
