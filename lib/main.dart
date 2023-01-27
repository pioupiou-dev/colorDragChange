import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color selectColor = Colors.black;

  List<Color> listColor = [
    Colors.black,
    Colors.white,
    Colors.purple,
    Colors.pink,
    Colors.blue
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          body: Stack(
        children: [
          DragTarget<Color>(
            onAccept: (data) {
              setState(() {
                selectColor = data;
              });
            },
            builder: (context, _, __) {
              return Container(
                color: selectColor,
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60,
              width: double.infinity,
              margin: const EdgeInsets.only(left: 20, bottom: 50, right: 20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(50)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  listColor.length,
                  (index) => Draggable(
                    data: listColor[index],
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: listColor[index], shape: BoxShape.circle),
                    ),
                    feedback: Stack(
                      clipBehavior: Clip.none,
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Opacity(
                          opacity: 0.7,
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  blurStyle: BlurStyle.normal,
                                  offset: Offset(5, 5),
                                  spreadRadius: 0,
                                  color: Color.fromARGB(140, 158, 158, 158))
                            ], color: listColor[index], shape: BoxShape.circle),
                          ),
                        ),
                        Positioned(
                            right: -10,
                            top: -5,
                            child: Container(
                              alignment: Alignment.center,
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green,
                              ),
                              child: Icon(
                                Icons.add,
                                size: 15,
                                color: Colors.white,
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
