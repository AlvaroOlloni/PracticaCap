import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mi_app/ui/login/login.dart';

String email = FirebaseAuth.instance.currentUser!.email.toString();

final userName = TextEditingController();

Widget cuerpo() {
  return Container(
    decoration: const BoxDecoration(
      color: Color.fromARGB(255, 21, 21, 21),
      image: DecorationImage(
        image: AssetImage("fondo_home3.jpg"),
        fit: BoxFit.cover,
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          height: 80,
        ),
        cardName(),
        //cardNote(),
      ],
    ),
  );
}

Card cardName() {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: const EdgeInsets.only(left: 30, top: 15, bottom: 15, right: 30),
    elevation: 4,
    shadowColor: Colors.white,
    color: Colors.black,
    child: Column(
      children: <Widget>[
        Column(
          children: [
            const ListTile(
              title: Text(
                'Username:',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              leading: Icon(
                Icons.person,
                size: 70,
                color: Color.fromARGB(255, 0, 110, 255),
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
                        fontSize: 30,
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
        StreamBuilder<Object>(
            stream: null,
            builder: (context, snapshot) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () => {createAlertDialog(context)},
                    style: TextButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                    child: const Text(
                      'Change',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 0, 110, 255),
                      ),
                    ),
                  ),
                  const Text('      '),
                  botonSalir(),
                  //const Text(" "),
                ],
              );
            }),
        const SizedBox(
          height: 10,
        ),
      ],
    ),
  );
}

createAlertDialog(BuildContext context) {
  final userName = TextEditingController();

  String name = ' ';

  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Cambiar nombre de usuario"),
        content: TextField(
          controller: userName,
        ),
        actions: <Widget>[
          MaterialButton(
            elevation: 0.5,
            child: const Text("Aceptar"),
            onPressed: () {
              name = userName.text;

              final infoChanged = <String, String>{"Username": name};

              FirebaseFirestore.instance
                  .collection("users")
                  .doc(FirebaseAuth.instance.currentUser!.email.toString())
                  .set(infoChanged);

              Navigator.of(context).pop(userName.text.toString());
            },
          )
        ],
      );
    },
  );
}

Widget botonSalir() {
  return StreamBuilder(
      stream: null,
      builder: (context, snapshot) {
        return TextButton(
          style: TextButton.styleFrom(
              elevation: 10,
              shadowColor: Colors.blue,
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
            "Log Out",
            style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 0, 110, 255),
            ),
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
