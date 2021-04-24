import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String operaciones = "";
  String resultOperacion = "";

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
            child: Row(
              children: [Text(resultOperacion)],
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
    double num1 = double.parse(datos[0]);
    double num2 = double.parse(datos[2]);
    double resultado = 0;
    switch (datos[1].trim()) {
      case "+":
        resultado = num1 + num2;
        break;
      case "-":
        resultado = num1 - num2;
        break;
      case "x":
        resultado = num1 * num2;
        break;
      case "/":
        if (num2 > 0) {
          resultado = num1 / num2;
        } else {
          resultado = 0;
        }
        break;
      default:
        resultado = 0;
    }
    setState(() {
      String op = datos[1];
      resultOperacion += "$num1 $op $num2 = $resultado \n\n";
    });
  }
}
