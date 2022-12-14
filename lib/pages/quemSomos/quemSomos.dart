import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:temaqui/data/config.dart';

class QuemSomos extends StatefulWidget {
  QuemSomos(
      {Key? key, this.isDraw = false, this.xOffset = 300, this.yOffset = 80})
      : super(key: key);
  double xOffset;
  double yOffset;
  bool isDraw;

  @override
  State<QuemSomos> createState() => _QuemSomosState();
}

class _QuemSomosState extends State<QuemSomos> {
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
          height: Get.size.height,
          width: Get.size.width,
          transform:
              Matrix4.translationValues(widget.xOffset, widget.yOffset, 0)
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
                  ? BoxShadow(
                      color: Colors.grey, blurRadius: 5, spreadRadius: 2)
                  : BoxShadow()
            ],
          ),
          child: Column(
            children: <Widget>[
              //AppBar
              Container(
                // height: 100,
                decoration: BoxDecoration(
                  gradient: appBarGradient,
                  borderRadius: widget.isDraw
                      ? BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(50),
                        )
                      : BorderRadius.only(
                          bottomRight: Radius.circular(50),
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
                                            Get.size.width * .1;
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
                              'QUEM SOMOS',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
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
                      Container(
                        padding: EdgeInsets.only(left: 10, bottom: 20),
                        child: Row(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.center,
                                  width: Get.size.width - 10,
                                  padding: EdgeInsets.only(right: 10),
                                  child: Wrap(
                                    children: [
                                      Text(
                                        'Conhe??a um pouco sobre nossa hist??ria',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Arial',
                                          decoration: TextDecoration.none,
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

              //Corpo
              Expanded(
                child: IgnorePointer(
                  ignoring: widget.isDraw ? true : false,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: widget.isDraw
                            ? BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20))
                            : BorderRadius.circular(0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            height: Get.size.height / 5,
                            width: Get.size.height / 5,
                            // padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                gradient: appBarGradient,
                                borderRadius: BorderRadius.circular(30)),
                            child: Container(
                              margin: EdgeInsets.all(10),
                              child: Image.asset(
                                'assets/logo_white.png',
                                filterQuality: FilterQuality.medium,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                          Text.rich(
                              textAlign: TextAlign.justify,
                              style:
                                  TextStyle(color: Color.fromRGBO(0, 0, 0, 1)),
                              TextSpan(children: [
                                TextSpan(
                                    text: 'aa',
                                    style:
                                        TextStyle(color: Colors.transparent)),
                                TextSpan(
                                  text: 'Nossa Hist??ria\n',
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 20,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  children: [
                                    TextSpan(
                                        text: '\naa',
                                        style: TextStyle(
                                            color: Colors.transparent)),
                                    TextSpan(
                                        text: 'TEM AQUI ',
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                        text:
                                            '?? uma plataforma de servi??os que atua na regi??o do Vale do S??o Francisco, com o objetivo de intermediar a rela????o entre clientes e profissionais de servi??o que atuam em diversas ??reas.\n'),
                                    TextSpan(
                                        text: '\naa',
                                        style: TextStyle(
                                            color: Colors.transparent)),
                                    TextSpan(
                                        text:
                                            'Para isto, oferece a seus usu??rios uma experi??ncia de busca pr??tica, segura, ao alcance de um clique, ideal para pessoas que levam uma vida corrida, e por isso, buscam praticidade e rapidez na hora de contactar um profissional de servi??o.\n'),
                                    TextSpan(
                                        text: '\naa',
                                        style: TextStyle(
                                            color: Colors.transparent)),
                                    TextSpan(text: 'A plataforma '),
                                    TextSpan(
                                        text: 'TEM AQUI ',
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(children: [
                                      TextSpan(
                                          text:
                                              'disp??e de uma lista de credenciados com diversos profissionais de ??reas distintas, agrupados por categorias para proporcionar uma busca r??pida e pr??tica, sem que o cliente precise realizar cadastro.\n'),
                                      TextSpan(
                                          text: '\naa',
                                          style: TextStyle(
                                              color: Colors.transparent)),
                                      TextSpan(
                                          text:
                                              'Al??m disso, o usu??rio conta com o sistema de avalia????o da plataforma para publicar sua avalia????o da qualidade do servi??o prestado, gerando uma refer??ncia que ajuda outros usu??rios na hora de escolher um profissional e contactar um servi??o.\n'),
                                      TextSpan(
                                          text: '\naa',
                                          style: TextStyle(
                                              color: Colors.transparent)),
                                      TextSpan(
                                          text:
                                              'A plataforma oferece aos profissionais credenciados pre??o e condi????es que se diferenciam dos praticados atualmente no mercado, aliando esse diferencial a uma divulga????o positiva do seu trabalho nas diversas redes sociais que visa oferecer maior visibilidade do profissional e confian??a no servi??o prestado.\n'),
                                    ]),
                                    TextSpan(
                                        text: '\naa',
                                        style: TextStyle(
                                            color: Colors.transparent)),
                                    TextSpan(text: 'A equipe '),
                                    TextSpan(
                                        text: 'TEM AQUI ',
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                        text:
                                            'visa realizar seu trabalho pautado em valores, guiada por uma vis??o para cumprimento de sua miss??o no mercado.\n'),
                                    TextSpan(
                                        text: '\naa',
                                        style: TextStyle(
                                            color: Colors.transparent)),
                                    TextSpan(
                                        text: 'VALORES: ',
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                        text:
                                            'Valoriza????o de profissionais: compromisso com os clientes e colaboradores; execu????o das a????es de forma ??tica, com empatia, respeito e integridade.\n'),
                                    TextSpan(
                                        text: '\naa',
                                        style: TextStyle(
                                            color: Colors.transparent)),
                                    TextSpan(
                                        text: 'VIS??O: ',
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                        text:
                                            'Ser l??der no mercado de servi??os e uma refer??ncia na ??rea de intermedia????o.\n'),
                                    TextSpan(
                                        text: '\naa',
                                        style: TextStyle(
                                            color: Colors.transparent)),
                                    TextSpan(
                                        text: 'MISS??O: ',
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                        text:
                                            'Atender as necessidades das pessoas rapidamente e sem burocracia, transformando profissionais em parceiros, de forma a impulsionar seus talentos.'),
                                  ],
                                ),
                              ])),
                        ],
                      ),
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
}
