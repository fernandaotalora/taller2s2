import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taller2s2/page/resultados.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String operaciones = "";
  String resultOperacion = "";
  List<Text> listResultado = [];
  var operadores = ["√", "^2", "%", "/", "x", "+", "-"];
  String aux = "";

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
                    mainAxisAlignment: MainAxisAlignment.end,
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ResultadosPage(
                                        listadoResultados: listResultado)));
                            /*setState(() {
                              operaciones += ".";
                            });*/
                          },
                          child: Text(".")),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              operaciones += " % ";
                            });
                          },
                          child: Text("%")),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              operaciones += " √ ";
                            });
                          },
                          child: Text("√")),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              operaciones += " ^2 ";
                            });
                          },
                          child: Text("x^2"))
                    ]),
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
                              aux = "";
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
    String msj = "";
    double res = 0;
    var ver = false;

    try {
      var datos = operaciones.split(" ");
      int auxp = 0;

      if (datos.length == 1) {
        if (datos[0] != aux) {
          aux = msj = datos[0];
          ver = true;
        }
      } else {
        for (int j = 0; j < operadores.length; j++) {
          for (int i = 0; i < datos.length; i++) {
            if (operadores[j] == datos[i]) {
              if (operadores[j] == "√") {
                res = sqrt(int.parse(datos[i + 1]));
                auxp = i + 1;
              }

              if (operadores[j] == "^2") {
                res = pow(double.parse(datos[i - 1]), 2);
                auxp = i;
              }

              if (operadores[j] == "%") {
                res = double.parse(datos[i - 1]) / 100;
                auxp = i;
              }

              if (operadores[j] == "/") {
                if (res == 0) {
                  if (int.parse(datos[i + 1]) != 0) {
                    res = int.parse(datos[i - 1]) / int.parse(datos[i + 1]);
                  } else {
                    operaciones += "\n Error no se puede dividir por 0";
                  }
                } else {
                  if (i < auxp) {
                    if (int.parse(datos[i + 1]) != 0) {
                      res = res / double.parse(datos[i - 1]);
                    } else {
                      operaciones += "\n Error no se puede dividir por 0";
                    }
                  } else {
                    if (int.parse(datos[i + 1]) != 0) {
                      res = res / double.parse(datos[i + 1]);
                    } else {
                      operaciones += "\n Error no se puede dividir por 0";
                    }
                  }
                }
                auxp = i;
              }

              if (operadores[j] == "x") {
                if (res == 0) {
                  res = double.parse(datos[i - 1]) * double.parse(datos[i + 1]);
                } else {
                  if (i < auxp) {
                    res = res * double.parse(datos[i - 1]);
                  } else {
                    res = res * double.parse(datos[i + 1]);
                  }
                }
                auxp = i;
              }

              if (operadores[j] == "+") {
                if (res == 0) {
                  res = double.parse(datos[i - 1]) + double.parse(datos[i + 1]);
                } else {
                  if (i < auxp) {
                    res = res + double.parse(datos[i - 1]);
                  } else {
                    res = res + double.parse(datos[i + 1]);
                  }
                }
                // auxp = i;
              }

              if (operadores[j] == "-") {
                if (res == 0) {
                  res = double.parse(datos[i - 1]) - double.parse(datos[i + 1]);
                } else {
                  if (i < auxp) {
                    res = res - double.parse(datos[i - 1]);
                  } else {
                    res = res - double.parse(datos[i + 1]);
                  }
                }
                // auxp = i;
              }
            }
          }
        }
        msj = "$operaciones = $res";
        ver = true;
      }
    } on FormatException catch (e) {
      _showMyDialog("Expresion mal formada");
    } catch (e) {
      print("Error $e");
    } finally {
      if (ver) {
        setState(() {
          listResultado.add(Text(msj));
        });
      }
    }
  }

  Future<void> _showMyDialog(msj) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Error',
            style: TextStyle(color: Colors.red),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(msj),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
