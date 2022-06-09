import 'package:flutter/material.dart';

import '../register/widgets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Llamada a la clase widgets (ui/login/widgets)
      body: cuerpo(),
    );
  }
}
