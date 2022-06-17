import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

comprobar() {
  if (getCableChest() == false) {}
}

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
    existe = 'false';
  }

  return existe;
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
