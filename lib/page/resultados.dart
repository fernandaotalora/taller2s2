import 'package:flutter/material.dart';

class ResultadosPage extends StatelessWidget {
  final List<Text> listadoResultados;

  ResultadosPage({@required this.listadoResultados});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resultado de las operaciones"),
      ),
      body: Column(
        children: listadoResultados,
      ),
    );
  }
}
