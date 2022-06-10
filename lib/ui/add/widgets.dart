import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mi_app/ui/nav.dart';

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
          children: [
            const SizedBox(
              height: 250,
            ),
            Builder(
              builder: (context) {
                return Text(
                  'Añade una nota',
                  style: GoogleFonts.alfaSlabOne(
                      textStyle: const TextStyle(fontSize: 40)),
                );
              },
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
          width: 270,
          child: StreamBuilder(
            stream: null,
            builder: (context, snapshot) {
              return TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
                onPressed: () async {
                  Navigator.pop(
                    context,
                  );
                },
                child: const Text(
                  "Volver",
                  style: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 255, 255, 255)),
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
    decoration: const InputDecoration(
      hintText: "Título",
      fillColor: Colors.white,
      filled: true,
    ),
  );
}

Widget campoContenido() {
  return TextField(
    controller: contenido,
    decoration: const InputDecoration(
      hintText: "Contenido",
      fillColor: Color.fromARGB(255, 255, 255, 255),
      filled: true,
    ),
  );
}

Widget botonGuardar() {
  return StreamBuilder(
    stream: null,
    builder: (context, snapshot) {
      return TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.black),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 5.0, horizontal: 100.0),
          ),
        ),
        onPressed: () async {
          t = titulo.text;
          c = contenido.text;

          final notas = <String, String>{
            "titulo": t,
            "contenido": c,
          };

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
          "Guardar",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    },
  );
}
