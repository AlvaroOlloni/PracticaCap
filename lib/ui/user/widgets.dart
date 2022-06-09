import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mi_app/ui/login/login.dart';

Widget cuerpo() {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(
            "https://www.androidsis.com/wp-content/uploads/2009/06/fondos-de-pantalla-de-paisajes-2.jpg"),
        fit: BoxFit.cover,
      ),
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          botonSalir(),
        ],
      ),
    ),
  );
}

Widget botonSalir() {
  return StreamBuilder(
      stream: null,
      builder: (context, snapshot) {
        return TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 5.0, horizontal: 100.0),
            ),
          ),
          onPressed: () async {
            _signOut();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Inicio(),
              ),
            );
          },
          child: const Text(
            "Salir",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        );
      });
}

Future<void> _signOut() async {
  await FirebaseAuth.instance.signOut();
  if (FirebaseAuth.instance.currentUser == null) {
    print("Sesión cerrada");
  }
}
