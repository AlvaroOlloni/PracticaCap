import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mi_app/ui/nav.dart';

import 'widgets.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Llamada a la clase widgets (ui/login/widgets)
      body: cuerpo(),
    );
  }

  _navigateToHome() async {
    if (FirebaseAuth.instance.currentUser == null) {
      //print('User is currently signed out!');
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => const Inicio()));
    } else if (FirebaseAuth.instance.currentUser != null) {
      //print('User is signed in!');
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const NavScreen()));
    }
  }
}
