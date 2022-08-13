import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen(
      {Key? key, this.isDraw = false, this.xOffset = 0, this.yOffset = 0})
      : super(key: key);
  bool isDraw;
  double xOffset;
  double yOffset;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  bool isDrawerOpen = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var heigthbar = AppBar().preferredSize.height;
    var padding = MediaQuery.of(context).padding;
    return SafeArea(
      child: AnimatedContainer(
        height: Get.size.height,
        width: Get.size.width,
        transform: Matrix4.translationValues(widget.xOffset, widget.yOffset, 0)
          ..scale(widget.isDraw ? 0.85 : 1.00)
          ..rotateZ(widget.isDraw ? -50 : 0),
        duration: Duration(milliseconds: 500),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: widget.isDraw
              ? BorderRadius.circular(20)
              : BorderRadius.circular(0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            //AppBar
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Color.fromRGBO(81, 39, 227, 1),
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
                                      widget.xOffset = 360;
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
                            'HOME',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
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
                                  'SUBTITLE',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Description'.toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w200),
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

            //Corpo da Página

            Expanded(
              //Add um IgnoredPoint para bloquear o uso da Lista ao acessar o menu
              child: IgnorePointer(
                ignoring: widget.isDraw ? true : false,
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(top: 5),
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                              Theme.of(context).backgroundColor.withAlpha(100),
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.home),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Item ${index}'),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
