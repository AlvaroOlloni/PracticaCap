import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mi_app/ui/navigation/nav.dart';

Widget cuerpo() {
  return Container(
    decoration: const BoxDecoration(
      color: Colors.white,
      image: DecorationImage(
        image: AssetImage("fondo_home2.png"),
        fit: BoxFit.cover,
      ),
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              height: 200,
            ),
          ],
        ),
        SizedBox(
          width: 300,
          child: campoTitulo(),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 300,
          child: campoContenido(),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          child: botonGuardar(),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 100,
          child: StreamBuilder(
            stream: null,
            builder: (context, snapshot) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () async {
                  Navigator.pop(
                    context,
                  );
                  titulo.clear();
                  contenido.clear();
                },
                child: const Text(
                  "Back",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              );
            },
          ),
        )
      ],
    ),
  );
}

final titulo = TextEditingController();

final contenido = TextEditingController();

String t = '';
String c = '';

Widget campoTitulo() {
  return TextField(
    controller: titulo,
    maxLength: 20,
    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    decoration: const InputDecoration(
      hintText: "Tittle",
      fillColor: Color.fromARGB(98, 0, 166, 255),
      filled: true,
      hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
    ),
  );
}

Widget campoContenido() {
  return TextField(
    controller: contenido,
    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    decoration: const InputDecoration(
      hintText: "Content",
      fillColor: Color.fromARGB(98, 0, 166, 255),
      filled: true,
      hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
    ),
  );
}

Widget botonGuardar() {
  return StreamBuilder(
    stream: null,
    builder: (context, snapshot) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 4,
          shadowColor: Colors.white,
          primary: Colors.white,
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
          ),
        ),
        onPressed: () async {
          t = titulo.text;
          c = contenido.text;

          final notas = <String, String>{
            "titulo": t,
            "contenido": c,
          };

          titulo.clear();
          contenido.clear();

          FirebaseFirestore.instance
              .collection(FirebaseAuth.instance.currentUser!.email.toString())
              .add(notas);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NavScreen(),
            ),
          );
        },
        child: const Text(
          "Save",
          style: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    },
  );
}
