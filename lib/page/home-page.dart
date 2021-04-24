import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String operaciones = "";
  String resultOperacion = "";
  List<Text> listResultado = [];
  var operadores = ["r", "p", "/", "x", "+", "-"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora"),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: listResultado,
                  )
                ],
              ),
            ),
          ),
        ),
        Container(
          color: Colors.blue,
          height: 100,
          child: Row(
            children: [
              Text(operaciones),
            ],
          ),
        ),
        Container(
            color: Colors.yellow,
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              operaciones += "7";
                            });
                          },
                          child: Text("7")),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              operaciones += "8";
                            });
                          },
                          child: Text("8")),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              operaciones += "9";
                            });
                          },
                          child: Text("9")),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              operaciones += " / ";
                            });
                          },
                          child: Text("/"))
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              operaciones += "4";
                            });
                          },
                          child: Text("4")),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              operaciones += "5";
                            });
                          },
                          child: Text("5")),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              operaciones += "6";
                            });
                          },
                          child: Text("6")),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              operaciones += " x ";
                            });
                          },
                          child: Text("x"))
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              operaciones += "1";
                            });
                          },
                          child: Text("1")),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              operaciones += "2";
                            });
                          },
                          child: Text("2")),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              operaciones += "3";
                            });
                          },
                          child: Text("3")),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              operaciones += " - ";
                            });
                          },
                          child: Text("-"))
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              operaciones += "0";
                            });
                          },
                          child: Text("0")),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              operaciones = "";
                              //   resultOperacion = "";
                            });
                          },
                          child: Text("C")),
                      ElevatedButton(
                          onPressed: _calculoOperaciones, child: Text("=")),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              operaciones += " + ";
                            });
                          },
                          child: Text("+"))
                    ]),
              ],
            )),
      ],
    );
  }

  void _calculoOperaciones() {
    var datos = operaciones.split(" ");
    double res = 0;
    int auxp = 0;

    for (int j = 0; j < operadores.length; j++) {
      for (int i = 0; i < datos.length; i++) {
        if (operadores[j] == datos[i]) {
          if (operadores[j] == "r") {
            res = sqrt(int.parse(datos[i + 1]));
          }

          if (operadores[j] == "p") {
            res = pow(int.parse(datos[i + 1]), 2);
          }

          if (operadores[j] == "/") {
            if (res == 0) {
              res = int.parse(datos[i - 1]) / int.parse(datos[i + 1]);
              auxp = i;
            }
          }

          if (operadores[j] == "x") {
            if (res == 0) {
              res = double.parse(datos[i - 1]) * double.parse(datos[i + 1]);
              auxp = i;
            } else {
              if (i < auxp) {
                res = res * double.parse(datos[i - 1]);
              } else {
                res = res * double.parse(datos[i + 1]);
              }
            }
          }

          if (operadores[j] == "+") {
            if (res == 0) {
              res = double.parse(datos[i - 1]) + double.parse(datos[i + 1]);
              auxp = i;
            } else {
              if (i < auxp) {
                res = res + double.parse(datos[i - 1]);
              } else {
                res = res + double.parse(datos[i + 1]);
              }
            }
          }

          if (operadores[j] == "-") {
            if (res == 0) {
              res = double.parse(datos[i - 1]) - double.parse(datos[i + 1]);
              auxp = i;
            } else {
              if (i < auxp) {
                res = res - double.parse(datos[i - 1]);
              } else {
                res = res - double.parse(datos[i + 1]);
              }
            }
          }
        }
      }
    }
    print(res);

    setState(() {
      listResultado.add(Text("$operaciones = $res"));
    });
  }
}
