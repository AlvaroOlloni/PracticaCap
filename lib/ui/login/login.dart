import 'package:flutter/material.dart';

import 'widgets.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Llamada a la clase widgets (ui/login/widgets)
      body: cuerpo(),
    );
  }
}
