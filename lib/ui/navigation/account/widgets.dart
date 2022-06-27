import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mi_app/ui/user/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

String email = FirebaseAuth.instance.currentUser!.email.toString();

final userName = TextEditingController();

final storageRef = FirebaseStorage.instance.ref();

Widget cuerpo() {
  return Container(
    width: 400,
    decoration: const BoxDecoration(
      color: Color.fromARGB(255, 21, 21, 21),
      image: DecorationImage(
        image: AssetImage("fondo_home3.jpg"),
        fit: BoxFit.cover,
      ),
    ),
    child: Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [cardName()],
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
        backgroundColor: const Color.fromARGB(255, 34, 56, 67),
        title: const Text(
          "Change username",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        content: TextField(
          controller: userName,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          decoration: const InputDecoration(
            hintText: "New username",
            fillColor: Color.fromARGB(99, 27, 38, 44),
            filled: true,
            hintStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        actions: <Widget>[
          MaterialButton(
            elevation: 0.5,
            child: const Text(
              "Confirm",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
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
        return SizedBox(
          width: 100,
          height: 60,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              side: const BorderSide(
                color: Colors.black,
                width: 6,
              ),
              elevation: 5,
              shadowColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () async {
              _signOut();
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove(FirebaseAuth.instance.currentUser!.email.toString());
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
                color: Colors.black,
              ),
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

Widget cardName() {
  return Flexible(
    child: Container(
      width: 400,
      height: 200,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("fondo_home3.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
        margin: const EdgeInsets.only(left: 30, top: 15, bottom: 15, right: 30),
        color: const Color.fromARGB(0, 250, 250, 250),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 15,
                ),
                const Icon(
                  Icons.person,
                  size: 80,
                ),
                Column(
                  children: [
                    const Text(
                      'Username:',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 63, 69, 255),
                      ),
                    ),
                    FutureBuilder<String>(
                      future: getName(),
                      builder: (context, snapshot) => Text(
                        snapshot.hasData ? snapshot.data! : "",
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 63, 69, 255)),
                        textWidthBasis: TextWidthBasis.parent,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 50,
                ),
                Flexible(
                  child: alertDialogSignOut(),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    ),
  );
}

StreamBuilder<Object> alertDialogSignOut() {
  return StreamBuilder<Object>(
    stream: null,
    builder: (context, snapshot) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 100,
            height: 60,
            child: OutlinedButton(
              onPressed: () => {createAlertDialog(context)},
              style: OutlinedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                side: const BorderSide(
                  color: Color.fromARGB(255, 0, 0, 0),
                  width: 6,
                ),
                elevation: 5,
                shadowColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Change',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          botonSalir(),
        ],
      );
    },
  );
}
