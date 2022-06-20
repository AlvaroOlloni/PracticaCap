import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mi_app/ui/gym/fuerza/mostrarFuerza.dart';

comprobar1() async {
  Future<String> getBenchPress() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    String existe = '';
    final document = await db
        .collection("Pecho")
        .doc(FirebaseAuth.instance.currentUser!.email.toString())
        .get();

    if (document.exists && document.get("Bench Press") == true) {
      existe = "Bench Press";
    } else {
      existe = "false";
    }
    return existe;
  }

  String getBench = await getBenchPress();
  if (getBench == "false") {
    return const Text(
      "Vacío",
      style: TextStyle(
        color: Colors.white,
        fontSize: 10,
      ),
    );
  } else {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: SizedBox(
            width: 410,
            height: 80,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      FutureBuilder<String>(
                        future: getBenchPress(),
                        builder: (context, snapshot) => Text(
                          snapshot.hasData ? snapshot.data! : "",
                          style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0)),
                          textWidthBasis: TextWidthBasis.parent,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Future<String> getCableChest() async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String existe = '';
  final document = await db
      .collection("Pecho")
      .doc(FirebaseAuth.instance.currentUser!.email.toString())
      .get();

  if (document.exists && document.get("Cable Chest") == true) {
    existe = "Cable Chest";
  } else {
    existe = 'false';
  }

  return existe;
}

/*
comprobar2() {
  if (getCableChest().toString() == "false") {
    return const Text(
      "Vacío",
      style: TextStyle(
        color: Colors.white,
        fontSize: 10,
      ),
    );
  } else {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        card2(),
      ],
    );
  }
}
*/
Future<String> getDecline() async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String existe = '';
  final document = await db
      .collection("Pecho")
      .doc(FirebaseAuth.instance.currentUser!.email.toString())
      .get();

  if (document.exists && document.get("Decline") == true) {
    existe = "Decline";
  } else {
    existe = 'false';
  }

  return existe;
}

Future<String> getDips() async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String existe = '';
  final document = await db
      .collection("Pecho")
      .doc(FirebaseAuth.instance.currentUser!.email.toString())
      .get();

  if (document.exists && document.get("Dips") == true) {
    existe = "Dips";
  } else {
    existe = 'false';
  }

  return existe;
}

Future<String> getDumbbell() async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String existe = '';
  final document = await db
      .collection("Pecho")
      .doc(FirebaseAuth.instance.currentUser!.email.toString())
      .get();

  if (document.exists && document.get("Dumbbell Flyes") == true) {
    existe = "Dumbbell";
  } else {
    existe = 'false';
  }

  return existe;
}

Future<String> getIncline() async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String existe = '';
  final document = await db
      .collection("Pecho")
      .doc(FirebaseAuth.instance.currentUser!.email.toString())
      .get();

  if (document.exists && document.get("Incline") == true) {
    existe = "Incline";
  } else {
    existe = 'false';
  }

  return existe;
}

Future<String> getPushUps() async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String existe = '';
  final document = await db
      .collection("Pecho")
      .doc(FirebaseAuth.instance.currentUser!.email.toString())
      .get();

  if (document.exists && document.get("Push Ups") == true) {
    existe = "Push Ups";
  } else {
    existe = 'false';
  }

  return existe;
}
