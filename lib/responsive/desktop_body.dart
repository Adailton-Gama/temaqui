import 'package:flutter/material.dart';

class DesktopBody extends StatelessWidget {
  const DesktopBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text('D E S K T O P'),
        centerTitle: true,
      ),
      body: Row(children: [
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.bottom -
                  MediaQuery.of(context).padding.top,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        //SEGUNDA COLUNA
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 4),
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: Container(
                                color: Colors.amber,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(top: 4),
                              child: ListView.builder(
                                itemCount: 8,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin:
                                        EdgeInsets.only(bottom: 4, right: 4),
                                    color: Colors.purple,
                                    height: 100,
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //SEGUNDA COLUNA
                    Expanded(
                      child: Container(
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
