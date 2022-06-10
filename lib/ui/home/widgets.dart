import 'package:flutter/material.dart';
import 'package:mi_app/api_rest/giphy_api.dart';

import '../add/add.dart';

Widget cuerpo() {
  return Container(
    height: double.infinity,
    decoration: const BoxDecoration(
      color: Colors.white,
      image: DecorationImage(
        image: AssetImage("fondo_home2.png"),
        fit: BoxFit.cover,
      ),
    ),
    child: Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            botonAdd(),
          ],
        ),
      ],
    ),
  );
}

Widget cuerpoRespaldo() {
  return Container(
    height: double.infinity,
    decoration: const BoxDecoration(
      color: Colors.white,
      image: DecorationImage(
        image: AssetImage("fondo_home2.png"),
        fit: BoxFit.cover,
      ),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 50,
        ),
        botonAdd(),
      ],
    ),
  );
}

Widget botonAdd() {
  return StreamBuilder(
    stream: null,
    builder: (context, snapshot) {
      return TextButton(
        style: TextButton.styleFrom(
          backgroundColor: const Color.fromARGB(100, 255, 255, 255),
          textStyle: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddScreen(),
            ),
          );
        },
        child: const Text(
          "Añadir una nota",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      );
    },
  );
}
