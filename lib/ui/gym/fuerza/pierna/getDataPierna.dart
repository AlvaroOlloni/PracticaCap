import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<String> getDeadLift() async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String existe = '';
  final document = await db
      .collection("Pierna")
      .doc(FirebaseAuth.instance.currentUser!.email.toString())
      .get();
  if (document.exists && document.get("DeadLift") == true) {
    existe = "DeadLift";
  } else {
    existe = "false";
  }
  return existe;
}

Widget card() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Flexible(
        child: SizedBox(
          width: 410,
          height: 110,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: const Color.fromARGB(122, 255, 255, 255),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Dead Lift",
                          style: GoogleFonts.blackHanSans(
                            fontSize: 40,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        StreamBuilder<Object>(
                          stream: null,
                          builder: (context, snapshot) {
                            return ElevatedButton(
                              onPressed: () {
                                final numSets = TextEditingController();

                                int num = 0;
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.black,
                                      title: const Text(
                                        "Change sets",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                        ),
                                      ),
                                      content: SizedBox(
                                        height: 100,
                                        width: 200,
                                        child: Column(
                                          children: [
                                            TextField(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: numSets,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                              decoration: const InputDecoration(
                                                hintText: "Sets",
                                                hintStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                fillColor: Color.fromARGB(
                                                    123, 255, 255, 255),
                                                filled: true,
                                              ),
                                            ),
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
                                            final CollectionReference
                                                collectionReference =
                                                FirebaseFirestore.instance
                                                    .collection("Pierna");
                                            collectionReference
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.email
                                                    .toString())
                                                .update({"setsLift": num});
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white),
                              child: const Text(
                                "Change ->",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 30,
                          child: FutureBuilder<
                              DocumentSnapshot<Map<String, dynamic>>>(
                            future: FirebaseFirestore.instance
                                .collection("Pierna")
                                .doc(FirebaseAuth.instance.currentUser!.email
                                    .toString())
                                .get(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var data = snapshot.data!.data();
                                var value = data!['setsLift'];
                                var value2 = data['RepsLift'];
                                return Text(
                                  '$value x $value2',
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                        ),
                        StreamBuilder<Object>(
                          stream: null,
                          builder: (context, snapshot) {
                            return ElevatedButton(
                              onPressed: () {
                                final numSets = TextEditingController();

                                int num = 0;
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.black,
                                      title: const Text(
                                        "Change sets",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                        ),
                                      ),
                                      content: SizedBox(
                                        height: 100,
                                        width: 200,
                                        child: Column(
                                          children: [
                                            TextField(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: numSets,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                              decoration: const InputDecoration(
                                                hintText: "Sets",
                                                hintStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                fillColor: Color.fromARGB(
                                                    123, 255, 255, 255),
                                                filled: true,
                                              ),
                                            ),
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
                                            final CollectionReference
                                                collectionReference =
                                                FirebaseFirestore.instance
                                                    .collection("Pierna");
                                            collectionReference
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.email
                                                    .toString())
                                                .update({"RepsLift": num});
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white),
                              child: const Text(
                                "<- Change",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            );
                          },
                        ),
                      ],
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

Future<String> getLegPress() async {
  String existe = '';
  final document = await FirebaseFirestore.instance
      .collection("Pierna")
      .doc(FirebaseAuth.instance.currentUser!.email.toString())
      .get();
  if (document.exists && document.get("Leg press") == true) {
    existe = "Leg press";
  } else {
    existe = "false";
  }
  return existe;
}

Widget card2() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Flexible(
        child: SizedBox(
          width: 410,
          height: 110,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: const Color.fromARGB(122, 255, 255, 255),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Leg press",
                          style: GoogleFonts.blackHanSans(
                            fontSize: 30,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        StreamBuilder<Object>(
                          stream: null,
                          builder: (context, snapshot) {
                            return ElevatedButton(
                              onPressed: () {
                                final numSets = TextEditingController();

                                int num = 0;
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.black,
                                      title: const Text(
                                        "Change sets",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                        ),
                                      ),
                                      content: SizedBox(
                                        height: 100,
                                        width: 200,
                                        child: Column(
                                          children: [
                                            TextField(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: numSets,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                              decoration: const InputDecoration(
                                                hintText: "Sets",
                                                hintStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                fillColor: Color.fromARGB(
                                                    123, 255, 255, 255),
                                                filled: true,
                                              ),
                                            ),
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
                                            final CollectionReference
                                                collectionReference =
                                                FirebaseFirestore.instance
                                                    .collection("Pierna");
                                            collectionReference
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.email
                                                    .toString())
                                                .update({"setsLegPress": num});
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white),
                              child: const Text(
                                "Change ->",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 30,
                          child: FutureBuilder<
                              DocumentSnapshot<Map<String, dynamic>>>(
                            future: FirebaseFirestore.instance
                                .collection("Pierna")
                                .doc(FirebaseAuth.instance.currentUser!.email
                                    .toString())
                                .get(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var data = snapshot.data!.data();
                                var value = data!['setsLegPress'];
                                var value2 = data['RepsLegPress'];
                                return Text(
                                  '$value x $value2',
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                        ),
                        StreamBuilder<Object>(
                          stream: null,
                          builder: (context, snapshot) {
                            return ElevatedButton(
                              onPressed: () {
                                final numSets = TextEditingController();

                                int num = 0;
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.black,
                                      title: const Text(
                                        "Change sets",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                        ),
                                      ),
                                      content: SizedBox(
                                        height: 100,
                                        width: 200,
                                        child: Column(
                                          children: [
                                            TextField(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: numSets,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                              decoration: const InputDecoration(
                                                hintText: "Sets",
                                                hintStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                fillColor: Color.fromARGB(
                                                    123, 255, 255, 255),
                                                filled: true,
                                              ),
                                            ),
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
                                            final CollectionReference
                                                collectionReference =
                                                FirebaseFirestore.instance
                                                    .collection("Pierna");
                                            collectionReference
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.email
                                                    .toString())
                                                .update({"RepsLegPress": num});
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white),
                              child: const Text(
                                "<- Change",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            );
                          },
                        ),
                      ],
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

Future<String> getHamstring() async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String existe = '';
  final document = await db
      .collection("Pierna")
      .doc(FirebaseAuth.instance.currentUser!.email.toString())
      .get();
  if (document.exists && document.get("Seated hamstring curl") == true) {
    existe = "Seated hamstring curl";
  } else {
    existe = "false";
  }
  return existe;
}

Widget card3() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Flexible(
        child: SizedBox(
          width: 410,
          height: 110,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: const Color.fromARGB(122, 255, 255, 255),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Seated hamstring curl",
                          style: GoogleFonts.blackHanSans(
                            fontSize: 30,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        StreamBuilder<Object>(
                          stream: null,
                          builder: (context, snapshot) {
                            return ElevatedButton(
                              onPressed: () {
                                final numSets = TextEditingController();

                                int num = 0;
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.black,
                                      title: const Text(
                                        "Change sets",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                        ),
                                      ),
                                      content: SizedBox(
                                        height: 100,
                                        width: 200,
                                        child: Column(
                                          children: [
                                            TextField(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: numSets,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                              decoration: const InputDecoration(
                                                hintText: "Sets",
                                                hintStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                fillColor: Color.fromARGB(
                                                    123, 255, 255, 255),
                                                filled: true,
                                              ),
                                            ),
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
                                            final CollectionReference
                                                collectionReference =
                                                FirebaseFirestore.instance
                                                    .collection("Pierna");
                                            collectionReference
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.email
                                                    .toString())
                                                .update({"setsHamstring": num});
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white),
                              child: const Text(
                                "Change ->",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 30,
                          child: FutureBuilder<
                              DocumentSnapshot<Map<String, dynamic>>>(
                            future: FirebaseFirestore.instance
                                .collection("Pierna")
                                .doc(FirebaseAuth.instance.currentUser!.email
                                    .toString())
                                .get(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var data = snapshot.data!.data();
                                var value = data!['setsHamstring'];
                                var value2 = data['RepsHamstring'];
                                return Text(
                                  '$value x $value2',
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                        ),
                        StreamBuilder<Object>(
                          stream: null,
                          builder: (context, snapshot) {
                            return ElevatedButton(
                              onPressed: () {
                                final numSets = TextEditingController();

                                int num = 0;
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.black,
                                      title: const Text(
                                        "Change sets",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                        ),
                                      ),
                                      content: SizedBox(
                                        height: 100,
                                        width: 200,
                                        child: Column(
                                          children: [
                                            TextField(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: numSets,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                              decoration: const InputDecoration(
                                                hintText: "Sets",
                                                hintStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                fillColor: Color.fromARGB(
                                                    123, 255, 255, 255),
                                                filled: true,
                                              ),
                                            ),
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
                                            final CollectionReference
                                                collectionReference =
                                                FirebaseFirestore.instance
                                                    .collection("Pierna");
                                            collectionReference
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.email
                                                    .toString())
                                                .update({"RepsHamstring": num});
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white),
                              child: const Text(
                                "<- Change",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            );
                          },
                        ),
                      ],
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

Future<String> getSeatedLeg() async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String existe = '';
  final document = await db
      .collection("Pierna")
      .doc(FirebaseAuth.instance.currentUser!.email.toString())
      .get();
  if (document.exists && document.get("Seated leg extension") == true) {
    existe = "Seated leg extension";
  } else {
    existe = "false";
  }
  return existe;
}

Widget card4() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Flexible(
        child: SizedBox(
          width: 410,
          height: 110,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: const Color.fromARGB(122, 255, 255, 255),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Seated leg extension",
                          style: GoogleFonts.blackHanSans(
                            fontSize: 30,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        StreamBuilder<Object>(
                          stream: null,
                          builder: (context, snapshot) {
                            return ElevatedButton(
                              onPressed: () {
                                final numSets = TextEditingController();

                                int num = 0;
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.black,
                                      title: const Text(
                                        "Change sets",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                        ),
                                      ),
                                      content: SizedBox(
                                        height: 100,
                                        width: 200,
                                        child: Column(
                                          children: [
                                            TextField(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: numSets,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                              decoration: const InputDecoration(
                                                hintText: "Sets",
                                                hintStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                fillColor: Color.fromARGB(
                                                    123, 255, 255, 255),
                                                filled: true,
                                              ),
                                            ),
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
                                            final CollectionReference
                                                collectionReference =
                                                FirebaseFirestore.instance
                                                    .collection("Pierna");
                                            collectionReference
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.email
                                                    .toString())
                                                .update(
                                                    {"setsLegExtension": num});
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white),
                              child: const Text(
                                "Change ->",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 30,
                          child: FutureBuilder<
                              DocumentSnapshot<Map<String, dynamic>>>(
                            future: FirebaseFirestore.instance
                                .collection("Pierna")
                                .doc(FirebaseAuth.instance.currentUser!.email
                                    .toString())
                                .get(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var data = snapshot.data!.data();
                                var value = data!['setsLegExtension'];
                                var value2 = data['RepsLegExtension'];
                                return Text(
                                  '$value x $value2',
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                        ),
                        StreamBuilder<Object>(
                          stream: null,
                          builder: (context, snapshot) {
                            return ElevatedButton(
                              onPressed: () {
                                final numSets = TextEditingController();

                                int num = 0;
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.black,
                                      title: const Text(
                                        "Change sets",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                        ),
                                      ),
                                      content: SizedBox(
                                        height: 100,
                                        width: 200,
                                        child: Column(
                                          children: [
                                            TextField(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: numSets,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                              decoration: const InputDecoration(
                                                hintText: "Sets",
                                                hintStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                fillColor: Color.fromARGB(
                                                    123, 255, 255, 255),
                                                filled: true,
                                              ),
                                            ),
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
                                            final CollectionReference
                                                collectionReference =
                                                FirebaseFirestore.instance
                                                    .collection("Pierna");
                                            collectionReference
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.email
                                                    .toString())
                                                .update(
                                                    {"RepsLegExtension": num});
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white),
                              child: const Text(
                                "<- Change",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            );
                          },
                        ),
                      ],
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

Future<String> getDumbbell() async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String existe = '';
  final document = await db
      .collection("Pierna")
      .doc(FirebaseAuth.instance.currentUser!.email.toString())
      .get();
  if (document.exists && document.get("Dumbbell lunge") == true) {
    existe = "Dumbbell lunge";
  } else {
    existe = "false";
  }
  return existe;
}

Widget card5() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Flexible(
        child: SizedBox(
          width: 410,
          height: 110,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: const Color.fromARGB(122, 255, 255, 255),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Dumbbell lunge",
                          style: GoogleFonts.blackHanSans(
                            fontSize: 40,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        StreamBuilder<Object>(
                          stream: null,
                          builder: (context, snapshot) {
                            return ElevatedButton(
                              onPressed: () {
                                final numSets = TextEditingController();

                                int num = 0;
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.black,
                                      title: const Text(
                                        "Change sets",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                        ),
                                      ),
                                      content: SizedBox(
                                        height: 100,
                                        width: 200,
                                        child: Column(
                                          children: [
                                            TextField(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: numSets,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                              decoration: const InputDecoration(
                                                hintText: "Sets",
                                                hintStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                fillColor: Color.fromARGB(
                                                    123, 255, 255, 255),
                                                filled: true,
                                              ),
                                            ),
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
                                            final CollectionReference
                                                collectionReference =
                                                FirebaseFirestore.instance
                                                    .collection("Pierna");
                                            collectionReference
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.email
                                                    .toString())
                                                .update({"setsDumbbell": num});
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white),
                              child: const Text(
                                "Change ->",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 30,
                          child: FutureBuilder<
                              DocumentSnapshot<Map<String, dynamic>>>(
                            future: FirebaseFirestore.instance
                                .collection("Pierna")
                                .doc(FirebaseAuth.instance.currentUser!.email
                                    .toString())
                                .get(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var data = snapshot.data!.data();
                                var value = data!['setsDumbbell'];
                                var value2 = data['RepsDumbbell'];
                                return Text(
                                  '$value x $value2',
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                        ),
                        StreamBuilder<Object>(
                          stream: null,
                          builder: (context, snapshot) {
                            return ElevatedButton(
                              onPressed: () {
                                final numSets = TextEditingController();

                                int num = 0;
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.black,
                                      title: const Text(
                                        "Change sets",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                        ),
                                      ),
                                      content: SizedBox(
                                        height: 100,
                                        width: 200,
                                        child: Column(
                                          children: [
                                            TextField(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: numSets,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                              decoration: const InputDecoration(
                                                hintText: "Sets",
                                                hintStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                fillColor: Color.fromARGB(
                                                    123, 255, 255, 255),
                                                filled: true,
                                              ),
                                            ),
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
                                            final CollectionReference
                                                collectionReference =
                                                FirebaseFirestore.instance
                                                    .collection("Pierna");
                                            collectionReference
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.email
                                                    .toString())
                                                .update({"RepsDumbbell": num});
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white),
                              child: const Text(
                                "<- Change",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            );
                          },
                        ),
                      ],
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

Future<String> getSquats() async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String existe = '';
  final document = await db
      .collection("Pierna")
      .doc(FirebaseAuth.instance.currentUser!.email.toString())
      .get();
  if (document.exists && document.get("Squats") == true) {
    existe = "Squats";
  } else {
    existe = "false";
  }
  return existe;
}

Widget card6() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Flexible(
        child: SizedBox(
          width: 410,
          height: 110,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: const Color.fromARGB(122, 255, 255, 255),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Squats",
                          style: GoogleFonts.blackHanSans(
                            fontSize: 26,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        StreamBuilder<Object>(
                          stream: null,
                          builder: (context, snapshot) {
                            return ElevatedButton(
                              onPressed: () {
                                final numSets = TextEditingController();

                                int num = 0;
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.black,
                                      title: const Text(
                                        "Change sets",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                        ),
                                      ),
                                      content: SizedBox(
                                        height: 100,
                                        width: 200,
                                        child: Column(
                                          children: [
                                            TextField(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: numSets,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                              decoration: const InputDecoration(
                                                hintText: "Sets",
                                                hintStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                fillColor: Color.fromARGB(
                                                    123, 255, 255, 255),
                                                filled: true,
                                              ),
                                            ),
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
                                            final CollectionReference
                                                collectionReference =
                                                FirebaseFirestore.instance
                                                    .collection("Pierna");
                                            collectionReference
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.email
                                                    .toString())
                                                .update({"setsSquats": num});
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white),
                              child: const Text(
                                "Change ->",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 30,
                          child: FutureBuilder<
                              DocumentSnapshot<Map<String, dynamic>>>(
                            future: FirebaseFirestore.instance
                                .collection("Pierna")
                                .doc(FirebaseAuth.instance.currentUser!.email
                                    .toString())
                                .get(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var data = snapshot.data!.data();
                                var value = data!['setsSquats'];
                                var value2 = data['RepsSquats'];
                                return Text(
                                  '$value x $value2',
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                        ),
                        StreamBuilder<Object>(
                          stream: null,
                          builder: (context, snapshot) {
                            return ElevatedButton(
                              onPressed: () {
                                final numSets = TextEditingController();

                                int num = 0;
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.black,
                                      title: const Text(
                                        "Change sets",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                        ),
                                      ),
                                      content: SizedBox(
                                        height: 100,
                                        width: 200,
                                        child: Column(
                                          children: [
                                            TextField(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: numSets,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                              decoration: const InputDecoration(
                                                hintText: "Sets",
                                                hintStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                fillColor: Color.fromARGB(
                                                    123, 255, 255, 255),
                                                filled: true,
                                              ),
                                            ),
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
                                            final CollectionReference
                                                collectionReference =
                                                FirebaseFirestore.instance
                                                    .collection("Pierna");
                                            collectionReference
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.email
                                                    .toString())
                                                .update({"RepsSquats": num});
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white),
                              child: const Text(
                                "<- Change",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            );
                          },
                        ),
                      ],
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

Future<String> getSingleLeg() async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String existe = '';
  final document = await db
      .collection("Pierna")
      .doc(FirebaseAuth.instance.currentUser!.email.toString())
      .get();
  if (document.exists && document.get("Single leg curl") == true) {
    existe = "Single leg curl";
  } else {
    existe = "false";
  }
  return existe;
}

Widget card7() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Flexible(
        child: SizedBox(
          width: 410,
          height: 110,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: const Color.fromARGB(122, 255, 255, 255),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Single leg curl",
                          style: GoogleFonts.blackHanSans(
                            fontSize: 28,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        StreamBuilder<Object>(
                          stream: null,
                          builder: (context, snapshot) {
                            return ElevatedButton(
                              onPressed: () {
                                final numSets = TextEditingController();

                                int num = 0;
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.black,
                                      title: const Text(
                                        "Change sets",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                        ),
                                      ),
                                      content: SizedBox(
                                        height: 100,
                                        width: 200,
                                        child: Column(
                                          children: [
                                            TextField(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: numSets,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                              decoration: const InputDecoration(
                                                hintText: "Sets",
                                                hintStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                fillColor: Color.fromARGB(
                                                    123, 255, 255, 255),
                                                filled: true,
                                              ),
                                            ),
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
                                            final CollectionReference
                                                collectionReference =
                                                FirebaseFirestore.instance
                                                    .collection("Pierna");
                                            collectionReference
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.email
                                                    .toString())
                                                .update({"setsSingleLeg": num});
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white),
                              child: const Text(
                                "Change ->",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 30,
                          child: FutureBuilder<
                              DocumentSnapshot<Map<String, dynamic>>>(
                            future: FirebaseFirestore.instance
                                .collection("Pierna")
                                .doc(FirebaseAuth.instance.currentUser!.email
                                    .toString())
                                .get(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var data = snapshot.data!.data();
                                var value = data!['setsSingleLeg'];
                                var value2 = data['RepsSingleLeg'];
                                return Text(
                                  '$value x $value2',
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                        ),
                        StreamBuilder<Object>(
                          stream: null,
                          builder: (context, snapshot) {
                            return ElevatedButton(
                              onPressed: () {
                                final numSets = TextEditingController();

                                int num = 0;
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.black,
                                      title: const Text(
                                        "Change sets",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                        ),
                                      ),
                                      content: SizedBox(
                                        height: 100,
                                        width: 200,
                                        child: Column(
                                          children: [
                                            TextField(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: numSets,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                              decoration: const InputDecoration(
                                                hintText: "Sets",
                                                hintStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                fillColor: Color.fromARGB(
                                                    123, 255, 255, 255),
                                                filled: true,
                                              ),
                                            ),
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
                                            final CollectionReference
                                                collectionReference =
                                                FirebaseFirestore.instance
                                                    .collection("Pierna");
                                            collectionReference
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.email
                                                    .toString())
                                                .update({"RepsSingleLeg": num});
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white),
                              child: const Text(
                                "<- Change",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            );
                          },
                        ),
                      ],
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
