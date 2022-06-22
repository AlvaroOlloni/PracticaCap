import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

check1(bool barbellSwitched, TextEditingController numSets,
    TextEditingController numSets2) {
  if (barbellSwitched == true) {
    return SizedBox(
      child: Column(
        children: [
          const Text(
            "Barbell biceps curl",
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
              fillColor: Color.fromARGB(123, 255, 255, 255),
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
              fillColor: Color.fromARGB(123, 255, 255, 255),
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

check2(bool preacherSwitched, TextEditingController numSets3,
    TextEditingController numSets4) {
  if (preacherSwitched == true) {
    return SizedBox(
      child: Column(
        children: [
          const Text(
            "Preacher biceps curl",
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
              fillColor: Color.fromARGB(123, 255, 255, 255),
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
              fillColor: Color.fromARGB(123, 255, 255, 255),
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

check3(bool cableBicepsSwitched, TextEditingController numSets5,
    TextEditingController numSets6) {
  if (cableBicepsSwitched == true) {
    return SizedBox(
      child: Column(
        children: [
          const Text(
            "Cable biceps curl",
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
              fillColor: Color.fromARGB(123, 255, 255, 255),
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
              fillColor: Color.fromARGB(123, 255, 255, 255),
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

check4(bool cableTricepsSwitched, TextEditingController numSets7,
    TextEditingController numSets8) {
  if (cableTricepsSwitched == true) {
    return SizedBox(
      child: Column(
        children: [
          const Text(
            "Cable triceps curl",
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
              fillColor: Color.fromARGB(123, 255, 255, 255),
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
              fillColor: Color.fromARGB(123, 255, 255, 255),
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

check5(bool dipsSwitched, TextEditingController numSets9,
    TextEditingController numSets10) {
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
              fillColor: Color.fromARGB(123, 255, 255, 255),
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
              fillColor: Color.fromARGB(123, 255, 255, 255),
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

check6(bool overheadSwitched, TextEditingController numSets11,
    TextEditingController numSets12) {
  if (overheadSwitched == true) {
    return SizedBox(
      child: Column(
        children: [
          const Text(
            "Overhead triceps extension",
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
              fillColor: Color.fromARGB(123, 255, 255, 255),
              filled: true,
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: numSets12,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
            decoration: const InputDecoration(
              hintText: "Reps",
              hintStyle: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              fillColor: Color.fromARGB(123, 255, 255, 255),
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

check7(bool closeGripSwitched, TextEditingController numSets13,
    TextEditingController numSets14) {
  if (closeGripSwitched == true) {
    return SizedBox(
      child: Column(
        children: [
          const Text(
            "Close grip bench",
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
              fillColor: Color.fromARGB(123, 255, 255, 255),
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
              fillColor: Color.fromARGB(123, 255, 255, 255),
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

checkDialog3(
    BuildContext context,
    bool barbellSwitched,
    bool preacherSwitched,
    bool cableBicepsSwitched,
    bool cableTricepsSwitched,
    bool tricepsDipsSwitched,
    bool overheadSwitched,
    bool closeGripSwitched) {
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

  if (barbellSwitched == false &&
      preacherSwitched == false &&
      cableBicepsSwitched == false &&
      cableTricepsSwitched == false &&
      tricepsDipsSwitched == false &&
      overheadSwitched == false &&
      closeGripSwitched == false) {
    return Fluttertoast.showToast(
        msg: "Nothing selected",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 24,
        backgroundColor: Colors.white,
        textColor: Colors.black);
  } else {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
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
                check1(barbellSwitched, numSets, numSets2),
                check2(preacherSwitched, numSets3, numSets4),
                check3(cableBicepsSwitched, numSets5, numSets6),
                check4(cableTricepsSwitched, numSets7, numSets8),
                check5(tricepsDipsSwitched, numSets9, numSets10),
                check6(overheadSwitched, numSets11, numSets12),
                check7(closeGripSwitched, numSets13, numSets14),
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
                if (numSets.text.isEmpty == true) {
                  num = 0;
                } else {
                  num = int.parse(numSets.text);
                }

                if (numSets2.text.isEmpty == true) {
                  num2 = 0;
                } else {
                  num2 = int.parse(numSets2.text);
                }

                if (numSets3.text.isEmpty == true) {
                  num3 = 0;
                } else {
                  num3 = int.parse(numSets3.text);
                }

                if (numSets4.text.isEmpty == true) {
                  num4 = 0;
                } else {
                  num4 = int.parse(numSets4.text);
                }

                if (numSets5.text.isEmpty == true) {
                  num5 = 0;
                } else {
                  num5 = int.parse(numSets5.text);
                }

                if (numSets6.text.isEmpty == true) {
                  num6 = 0;
                } else {
                  num6 = int.parse(numSets6.text);
                }

                if (numSets7.text.isEmpty == true) {
                  num7 = 0;
                } else {
                  num7 = int.parse(numSets7.text);
                }

                if (numSets8.text.isEmpty == true) {
                  num8 = 0;
                } else {
                  num8 = int.parse(numSets8.text);
                }

                if (numSets9.text.isEmpty == true) {
                  num9 = 0;
                } else {
                  num9 = int.parse(numSets9.text);
                }

                if (numSets10.text.isEmpty == true) {
                  num10 = 0;
                } else {
                  num10 = int.parse(numSets10.text);
                }

                if (numSets11.text.isEmpty == true) {
                  num11 = 0;
                } else {
                  num11 = int.parse(numSets11.text);
                }

                if (numSets12.text.isEmpty == true) {
                  num12 = 0;
                } else {
                  num12 = int.parse(numSets12.text);
                }

                if (numSets13.text.isEmpty == true) {
                  num13 = 0;
                } else {
                  num13 = int.parse(numSets13.text);
                }

                if (numSets14.text.isEmpty == true) {
                  num14 = 0;
                } else {
                  num14 = int.parse(numSets14.text);
                }

                final data = <String, dynamic>{
                  "Barbell biceps curl": barbellSwitched,
                  "Preacher biceps curl": preacherSwitched,
                  "Cable biceps curl": cableBicepsSwitched,
                  "Cable triceps pushdown": cableTricepsSwitched,
                  "Dips": tricepsDipsSwitched,
                  "Overhead Triceps Extensions": overheadSwitched,
                  "Close Grip Bench Presses": closeGripSwitched,
                  "setsBarbell": num,
                  "RepsBarbell": num2,
                  "setsPreacher": num3,
                  "RepsPreacher": num4,
                  "setsCableBiceps": num5,
                  "RepsCableBiceps": num6,
                  "setsCableTriceps": num7,
                  "RepsCableTriceps": num8,
                  "setsDips": num9,
                  "RepsDips": num10,
                  "setsOverhead": num11,
                  "RepsOverhead": num12,
                  "setsCloseGrips": num13,
                  "RepsCloseGrip": num14,
                };
                FirebaseFirestore.instance
                    .collection("Brazo")
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
