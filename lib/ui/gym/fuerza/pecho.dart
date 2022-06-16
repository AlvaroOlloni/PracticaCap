import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<String> getBenchPress() async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String existe = '';
  final document = await db
      .collection("Pecho")
      .doc(FirebaseAuth.instance.currentUser!.email.toString())
      .get();

  if (document.exists && document.get("Bench Press") == true) {
    existe = "true";
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
    existe = "true";
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
    existe = "true";
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
    existe = "true";
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
    existe = "true";
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
    existe = "true";
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
    existe = "true";
  } else {
    existe = 'false';
  }

  return existe;
}
