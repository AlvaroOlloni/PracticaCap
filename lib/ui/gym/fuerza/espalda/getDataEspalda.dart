import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<String> getDeadLift() async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String existe = '';
  final document = await db
      .collection("Espalda")
      .doc(FirebaseAuth.instance.currentUser!.email.toString())
      .get();
  if (document.exists && document.get("Dead Lift") == true) {
    existe = "Dead Lift";
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
            color: Color.fromARGB(122, 255, 255, 255),
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                                    .collection("Espalda");
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
                                .collection("Espalda")
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
                                                    .collection("Espalda");
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

Future<String> getDumbbellPull() async {
  String existe = '';
  final document = await FirebaseFirestore.instance
      .collection("Espalda")
      .doc(FirebaseAuth.instance.currentUser!.email.toString())
      .get();
  if (document.exists && document.get("Dumbbell Pull Over") == true) {
    existe = "Dumbbell Pull Over";
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
            color: Color.fromARGB(122, 255, 255, 255),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Dumbbell Pull Over",
                          style: GoogleFonts.blackHanSans(
                            fontSize: 30,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  decoration:
                                                      const InputDecoration(
                                                    hintText: "Sets",
                                                    hintStyle: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                if (numSets.text.isEmpty ==
                                                    true) {
                                                  num = 0;
                                                } else {
                                                  num = int.parse(numSets.text);
                                                }
                                                final CollectionReference
                                                    collectionReference =
                                                    FirebaseFirestore.instance
                                                        .collection("Espalda");
                                                collectionReference
                                                    .doc(FirebaseAuth.instance
                                                        .currentUser!.email
                                                        .toString())
                                                    .update(
                                                        {"setsDumbbell": num});
                                                Navigator.pop(context);
                                              },
                                            )
                                          ],
                                        );
                                      });
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
                            }),
                        SizedBox(
                          height: 30,
                          child: FutureBuilder<
                              DocumentSnapshot<Map<String, dynamic>>>(
                            future: FirebaseFirestore.instance
                                .collection("Espalda")
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
                                                    .collection("Espalda");
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

Future<String> getPullDown() async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String existe = '';
  final document = await db
      .collection("Espalda")
      .doc(FirebaseAuth.instance.currentUser!.email.toString())
      .get();
  if (document.exists && document.get("Pull Down") == true) {
    existe = "Pull Down";
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
            color: Color.fromARGB(122, 255, 255, 255),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Pull Down",
                          style: GoogleFonts.blackHanSans(
                            fontSize: 40,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                                    .collection("Espalda");
                                            collectionReference
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.email
                                                    .toString())
                                                .update({"setsPullDown": num});
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
                                .collection("Espalda")
                                .doc(FirebaseAuth.instance.currentUser!.email
                                    .toString())
                                .get(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var data = snapshot.data!.data();
                                var value = data!['setsPullDown'];
                                var value2 = data['RepsPullDown'];
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
                                                    .collection("Espalda");
                                            collectionReference
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.email
                                                    .toString())
                                                .update({"RepsPullDown": num});
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

Future<String> getPullOver() async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String existe = '';
  final document = await db
      .collection("Espalda")
      .doc(FirebaseAuth.instance.currentUser!.email.toString())
      .get();
  if (document.exists && document.get("Pull over") == true) {
    existe = "Pull over";
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
            color: Color.fromARGB(122, 255, 255, 255),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Pull over",
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
                                                    .collection("Espalda");
                                            collectionReference
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.email
                                                    .toString())
                                                .update({"setsOver": num});
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
                                .collection("Espalda")
                                .doc(FirebaseAuth.instance.currentUser!.email
                                    .toString())
                                .get(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var data = snapshot.data!.data();
                                var value = data!['setsOver'];
                                var value2 = data['RepsOver'];
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
                                                    .collection("Espalda");
                                            collectionReference
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.email
                                                    .toString())
                                                .update({"RepsOver": num});
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

Future<String> getSeatedRow() async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String existe = '';
  final document = await db
      .collection("Espalda")
      .doc(FirebaseAuth.instance.currentUser!.email.toString())
      .get();
  if (document.exists && document.get("Seated Row") == true) {
    existe = "Seated Row";
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
            color: Color.fromARGB(122, 255, 255, 255),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Seated Row",
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
                                                    .collection("Espalda");
                                            collectionReference
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.email
                                                    .toString())
                                                .update({"setsSeated": num});
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
                                .collection("Espalda")
                                .doc(FirebaseAuth.instance.currentUser!.email
                                    .toString())
                                .get(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var data = snapshot.data!.data();
                                var value = data!['setsSeated'];
                                var value2 = data['RepsSeated'];
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
                                                    .collection("Espalda");
                                            collectionReference
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.email
                                                    .toString())
                                                .update({"RepsSeated": num});
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

Future<String> getSingleArm() async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String existe = '';
  final document = await db
      .collection("Espalda")
      .doc(FirebaseAuth.instance.currentUser!.email.toString())
      .get();
  if (document.exists && document.get("Single Arm") == true) {
    existe = "Single Arm";
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
            color: Color.fromARGB(122, 255, 255, 255),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Single Arm",
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
                                                    .collection("Espalda");
                                            collectionReference
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.email
                                                    .toString())
                                                .update({"setsSingle": num});
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
                                .collection("Espalda")
                                .doc(FirebaseAuth.instance.currentUser!.email
                                    .toString())
                                .get(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var data = snapshot.data!.data();
                                var value = data!['setsSingle'];
                                var value2 = data['RepsSingle'];
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
                                                    .collection("Espalda");
                                            collectionReference
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.email
                                                    .toString())
                                                .update({"RepsSingle": num});
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

Future<String> getPullUps() async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String existe = '';
  final document = await db
      .collection("Espalda")
      .doc(FirebaseAuth.instance.currentUser!.email.toString())
      .get();
  if (document.exists && document.get("Pull Ups") == true) {
    existe = "Pull Ups";
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
            color: Color.fromARGB(122, 255, 255, 255),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Pull Ups",
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
                                                    .collection("Espalda");
                                            collectionReference
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.email
                                                    .toString())
                                                .update({"setsUps": num});
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
                                .collection("Espalda")
                                .doc(FirebaseAuth.instance.currentUser!.email
                                    .toString())
                                .get(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var data = snapshot.data!.data();
                                var value = data!['setsUps'];
                                var value2 = data['RepsUps'];
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
                                                    .collection("Espalda");
                                            collectionReference
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.email
                                                    .toString())
                                                .update({"RepsUps": num});
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
