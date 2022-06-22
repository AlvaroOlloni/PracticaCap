import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

check1(bool benchPressSwitched, TextEditingController numSets,
    TextEditingController numSets2) {
  if (benchPressSwitched == true) {
    return SizedBox(
      child: Column(
        children: [
          const Text(
            "Bench Press",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
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
            controller: numSets2,
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
    );
  } else {
    return const SizedBox();
  }
}

check2(bool pushUpsSwitched, TextEditingController numSets3,
    TextEditingController numSets4) {
  if (pushUpsSwitched == true) {
    return SizedBox(
      child: Column(
        children: [
          const Text(
            "Push Ups",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: numSets3,
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
            controller: numSets4,
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
    );
  } else {
    return const SizedBox();
  }
}

check3(bool dumbellSwitched, TextEditingController numSets5,
    TextEditingController numSets6) {
  if (dumbellSwitched == true) {
    return SizedBox(
      child: Column(
        children: [
          const Text(
            "Dumbbell Flyes",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: numSets5,
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
            controller: numSets6,
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
    );
  } else {
    return const SizedBox();
  }
}

check4(bool inclineSwitched, TextEditingController numSets7,
    TextEditingController numSets8) {
  if (inclineSwitched == true) {
    return SizedBox(
      child: Column(
        children: [
          const Text(
            "Incline",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: numSets7,
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
            controller: numSets8,
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
    );
  } else {
    return const SizedBox();
  }
}

check5(bool declineSwitched, TextEditingController numSets9,
    TextEditingController numSets10) {
  if (declineSwitched == true) {
    return SizedBox(
      child: Column(
        children: [
          const Text(
            "Decline",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: numSets9,
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
            controller: numSets10,
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
    );
  } else {
    return const SizedBox();
  }
}

check6(bool dipsSwitched, TextEditingController numSets11,
    TextEditingController numSets12) {
  if (dipsSwitched == true) {
    return SizedBox(
      child: Column(
        children: [
          const Text(
            "Dips",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: numSets11,
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
            controller: numSets12,
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
        ],
      ),
    );
  } else {
    return const SizedBox();
  }
}

check7(bool cableSwitched, TextEditingController numSets13,
    TextEditingController numSets14) {
  if (cableSwitched == true) {
    return SizedBox(
      child: Column(
        children: [
          const Text(
            "CableChest",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: numSets13,
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
            controller: numSets14,
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
    );
  } else {
    return const SizedBox();
  }
}

checkDialog(
    BuildContext context,
    bool benchPressSwitched,
    bool pushUpsSwitched,
    bool dumbellSwitched,
    bool inclineSwitched,
    bool declineSwitched,
    bool dipsSwitched,
    bool cableSwitched) {
  final numSets = TextEditingController();

  int num = 0;

  final numSets2 = TextEditingController();

  int num2 = 0;

  final numSets3 = TextEditingController();

  int num3 = 0;

  final numSets4 = TextEditingController();

  int num4 = 0;

  final numSets5 = TextEditingController();

  int num5 = 0;

  final numSets6 = TextEditingController();

  int num6 = 0;

  final numSets7 = TextEditingController();

  int num7 = 0;

  final numSets8 = TextEditingController();

  int num8 = 0;

  final numSets9 = TextEditingController();

  int num9 = 0;

  final numSets10 = TextEditingController();

  int num10 = 0;

  final numSets11 = TextEditingController();

  int num11 = 0;

  final numSets12 = TextEditingController();

  int num12 = 0;

  final numSets13 = TextEditingController();

  int num13 = 0;

  final numSets14 = TextEditingController();

  int num14 = 0;
  if (benchPressSwitched == false &&
      pushUpsSwitched == false &&
      dumbellSwitched == false &&
      inclineSwitched == false &&
      declineSwitched == false &&
      dipsSwitched == false &&
      cableSwitched == false) {
    return Fluttertoast.showToast(
        msg: "Nothing selected",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        fontSize: 24,
        backgroundColor: Colors.white,
        textColor: Colors.black);
  } else {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 34, 56, 67),
          title: const Text(
            "   Sets and reps",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          content: SizedBox(
            height: 400,
            width: 200,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                check1(benchPressSwitched, numSets, numSets2),
                check2(pushUpsSwitched, numSets3, numSets4),
                check3(dumbellSwitched, numSets5, numSets6),
                check4(inclineSwitched, numSets7, numSets8),
                check5(declineSwitched, numSets9, numSets10),
                check6(dipsSwitched, numSets11, numSets12),
                check7(cableSwitched, numSets13, numSets14),
              ],
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
                num = int.parse(numSets.text);
                num2 = int.parse(numSets2.text);
                num3 = int.parse(numSets3.text);
                num4 = int.parse(numSets4.text);
                num5 = int.parse(numSets5.text);
                num6 = int.parse(numSets6.text);
                num7 = int.parse(numSets7.text);
                num8 = int.parse(numSets8.text);
                num9 = int.parse(numSets9.text);
                num10 = int.parse(numSets10.text);
                num11 = int.parse(numSets11.text);
                num12 = int.parse(numSets12.text);
                num13 = int.parse(numSets13.text);
                num14 = int.parse(numSets14.text);

                final data = <String, dynamic>{
                  "Bench Press": benchPressSwitched,
                  "Push Ups": pushUpsSwitched,
                  "Dumbbell Flyes": dumbellSwitched,
                  "Incline": inclineSwitched,
                  "Decline": declineSwitched,
                  "Dips": dipsSwitched,
                  "Cable Chest": cableSwitched,
                  "setsBench": num,
                  "RepsBench": num2,
                  "setsPush": num3,
                  "RepsPush": num4,
                  "setsDumbbell": num5,
                  "RepsDumbbell": num6,
                  "setsIncline": num7,
                  "RepsIncline": num8,
                  "setsDecline": num9,
                  "RepsDecline": num10,
                  "setsDips": num11,
                  "RepsDips": num12,
                  "setsCable": num13,
                  "RepsCable": num14,
                };
                FirebaseFirestore.instance
                    .collection("Pecho")
                    .doc(FirebaseAuth.instance.currentUser!.email.toString())
                    .set(data);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
