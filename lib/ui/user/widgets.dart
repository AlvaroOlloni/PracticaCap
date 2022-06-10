import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mi_app/ui/login/login.dart';
import 'package:google_fonts/google_fonts.dart';

String email = FirebaseAuth.instance.currentUser!.email.toString();

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        cardName(),
        cardNote(),
      ],
    ),
  );
}

Widget cuerpoRespaldo() {
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
          children: [
            cardName(),
          ],
        ),
        Row(
          children: [cardNote()],
        ),
      ],
    ),
  );
}

Card cardName() {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: const EdgeInsets.only(left: 15, top: 15, bottom: 15, right: 100),
    elevation: 10,
    color: const Color.fromARGB(66, 0, 0, 0),
    child: Column(
      children: <Widget>[
        Column(
          children: [
            const ListTile(
              //contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
              title: Text(
                'Nombre:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              leading: Icon(
                Icons.person,
                size: 70,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 102,
                ),
                FutureBuilder<String>(
                  future: getName(),
                  builder: (context, snapshot) => Text(
                    snapshot.hasData ? snapshot.data! : "",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textWidthBasis: TextWidthBasis.parent,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () => {},
              style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              child: const Text(
                'Modificar',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            const Text('      '),
            botonSalir(),
            //const Text(" "),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    ),
  );
}

Card cardNote() {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: const EdgeInsets.only(left: 15, top: 15, bottom: 15, right: 200),
    color: const Color.fromARGB(66, 0, 0, 0),
    elevation: 10,
    child: Column(
      children: <Widget>[
        Column(
          children: const [
            ListTile(
              //contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
              title: Text(
                'Notas',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              leading: Icon(
                Icons.note_rounded,
                size: 70,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ],
        ),

        // Usamos una fila para ordenar los botones del card
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              width: 100,
            ),
            TextButton(
              onPressed: () => {},
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text(
                'Ver',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        )
      ],
    ),
  );
}

Widget botonSalir() {
  return StreamBuilder(
      stream: null,
      builder: (context, snapshot) {
        return TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
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
            "Cerrar Sesión",
            style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 0, 0, 0)),
          ),
        );
      });
}

Future<void> _signOut() async {
  await FirebaseAuth.instance.signOut();
  if (FirebaseAuth.instance.currentUser == null) {
    // ignore: avoid_print
    print("Sesión cerrada");
  }
}

Future<String> getName() async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  final document = await db
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser!.email.toString())
      .get();
  return document.exists ? document.data()!["Username"] : "No encontrado";
}

String getEmail() {
  return FirebaseAuth.instance.currentUser!.email.toString();
}
