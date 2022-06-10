import 'package:flutter/material.dart';
import 'package:mi_app/ui/user/user.dart';

import '../add/add.dart';

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
        const SizedBox(
          height: 80,
        ),
        cardNote(),
        const SizedBox(
          height: 20,
        ),
        cardAlarm(),
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
          backgroundColor: Colors.white,
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
          "Añadir",
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
      );
    },
  );
}

Card cardNote() {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: const EdgeInsets.only(left: 100, right: 100),
    color: const Color.fromARGB(80, 0, 0, 0),
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
        const SizedBox(
          height: 30,
        ),
        // Usamos una fila para ordenar los botones del card
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            botonAdd(),
            const SizedBox(
              width: 20,
            ),
            StreamBuilder(
              stream: null,
              builder: (context, snapshot) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    TextButton(
                      onPressed: () async => {},
                      style: TextButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: const Text(
                        'Ver',
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      ),
                    ),
                  ],
                );
              },
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

Card cardAlarm() {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: const EdgeInsets.only(left: 100, right: 100),
    color: const Color.fromARGB(80, 0, 0, 0),
    elevation: 10,
    child: Column(
      children: <Widget>[
        Column(
          children: const [
            ListTile(
              title: Text(
                'Alarmas',
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
        const SizedBox(
          height: 30,
        ),
        // Usamos una fila para ordenar los botones del card
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: null,
              builder: (context, snapshot) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    TextButton(
                      onPressed: () async => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UserScreen(),
                          ),
                        ),
                      },
                      style: TextButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: const Text(
                        'Crear',
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      ),
                    ),
                  ],
                );
              },
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
