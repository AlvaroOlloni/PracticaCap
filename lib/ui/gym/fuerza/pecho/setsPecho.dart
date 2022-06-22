import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

StreamBuilder<Object> setUpSets() {
  return StreamBuilder<Object>(
    stream: null,
    builder: (context, snapshot) {
      return SizedBox(
        width: 100,
        height: 60,
        child: OutlinedButton(
          onPressed: () => {createAlertDialog(context)},
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
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
      );
    },
  );
}

createAlertDialog(BuildContext context) {
  final numSets = TextEditingController();

  int num = 0;

  final numReps = TextEditingController();

  int num2 = 0;

  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: const Color.fromARGB(255, 34, 56, 67),
        title: const Text(
          "Sets and reps",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        content: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              controller: numSets,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                hintText: "Sets",
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                fillColor: Color.fromARGB(99, 27, 38, 44),
                filled: true,
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: numReps,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                hintText: "Reps",
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                fillColor: Color.fromARGB(99, 27, 38, 44),
                filled: true,
              ),
            ),
          ],
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
              num = numSets as int;

              num2 = numReps as int;
              /*
              final infoChanged = <String, int>{
                "sets": num,
                "Reps": num2,
              };
              
              FirebaseFirestore.instance
                  .collection("Pecho")
                  .doc(FirebaseAuth.instance.currentUser!.email.toString())
                  .set(infoChanged);
                  */

              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
