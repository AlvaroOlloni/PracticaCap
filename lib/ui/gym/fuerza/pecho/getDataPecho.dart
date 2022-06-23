import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

Widget card() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Bench Press",
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
                                                    .collection("Pecho");
                                            collectionReference
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.email
                                                    .toString())
                                                .update({"setsBench": num});
                                            Navigator.pop(context);
                                          },
                                        )
                                      ],
                                    );
                                  });
                            },
                            style:
                                ElevatedButton.styleFrom(primary: Colors.white),
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
                      child:
                          FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                        future: FirebaseFirestore.instance
                            .collection("Pecho")
                            .doc(FirebaseAuth.instance.currentUser!.email
                                .toString())
                            .get(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            var data = snapshot.data!.data();
                            var value = data!['setsBench'];
                            var value2 = data['RepsBench'];
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
                                        "Change Reps",
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
                                                hintText: "Reps",
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
                                                    .collection("Pecho");
                                            collectionReference
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.email
                                                    .toString())
                                                .update({"RepsBench": num});
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                  });
                            },
                            style:
                                ElevatedButton.styleFrom(primary: Colors.white),
                            child: const Text(
                              "<- Change",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          );
                        }),
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

Future<String> getCableChest() async {
  String existe = '';
  final document = await FirebaseFirestore.instance
      .collection("Pecho")
      .doc(FirebaseAuth.instance.currentUser!.email.toString())
      .get();
  if (document.exists && document.get("Cable Chest") == true) {
    existe = "Cable Chest";
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
                          "Cable Chest",
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
                                                        .collection("Pecho");
                                                collectionReference
                                                    .doc(FirebaseAuth.instance
                                                        .currentUser!.email
                                                        .toString())
                                                    .update({"setsCable": num});
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
                                .collection("Pecho")
                                .doc(FirebaseAuth.instance.currentUser!.email
                                    .toString())
                                .get(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var data = snapshot.data!.data();
                                var value = data!['setsCable'];
                                var value2 = data['RepsCable'];
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
                                            "Change Reps",
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
                                                    hintText: "Reps",
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
                                                        .collection("Pecho");
                                                collectionReference
                                                    .doc(FirebaseAuth.instance
                                                        .currentUser!.email
                                                        .toString())
                                                    .update({"RepsCable": num});
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        );
                                      });
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
                            }),
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
                          "Decline",
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
                                                        .collection("Pecho");
                                                collectionReference
                                                    .doc(FirebaseAuth.instance
                                                        .currentUser!.email
                                                        .toString())
                                                    .update(
                                                        {"setsDecline": num});
                                                Navigator.pop(context);
                                              },
                                            ),
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
                                .collection("Pecho")
                                .doc(FirebaseAuth.instance.currentUser!.email
                                    .toString())
                                .get(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var data = snapshot.data!.data();
                                var value = data!['setsDecline'];
                                var value2 = data['RepsDecline'];
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
                                            "Change Reps",
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
                                                    hintText: "Reps",
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
                                                        .collection("Pecho");
                                                collectionReference
                                                    .doc(FirebaseAuth.instance
                                                        .currentUser!.email
                                                        .toString())
                                                    .update(
                                                        {"RepsDecline": num});
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        );
                                      });
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
                            }),
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
                          "Dips",
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
                                                        .collection("Pecho");
                                                collectionReference
                                                    .doc(FirebaseAuth.instance
                                                        .currentUser!.email
                                                        .toString())
                                                    .update({"setsDips": num});
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
                                .collection("Pecho")
                                .doc(FirebaseAuth.instance.currentUser!.email
                                    .toString())
                                .get(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var data = snapshot.data!.data();
                                var value = data!['setsDips'];
                                var value2 = data['RepsDips'];
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
                                            "Change Reps",
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
                                                    hintText: "Reps",
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
                                                        .collection("Pecho");
                                                collectionReference
                                                    .doc(FirebaseAuth.instance
                                                        .currentUser!.email
                                                        .toString())
                                                    .update({"RepsDips": num});
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        );
                                      });
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
                            }),
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
      .collection("Pecho")
      .doc(FirebaseAuth.instance.currentUser!.email.toString())
      .get();
  if (document.exists && document.get("Dumbbell Flyes") == true) {
    existe = "Dumbbell Flyes";
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
                          "Dumbbell",
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
                                                    fontWeight:
                                                        FontWeight.bold),
                                                decoration:
                                                    const InputDecoration(
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
                                              if (numSets.text.isEmpty ==
                                                  true) {
                                                num = 0;
                                              } else {
                                                num = int.parse(numSets.text);
                                              }
                                              final CollectionReference
                                                  collectionReference =
                                                  FirebaseFirestore.instance
                                                      .collection("Pecho");
                                              collectionReference
                                                  .doc(FirebaseAuth.instance
                                                      .currentUser!.email
                                                      .toString())
                                                  .update(
                                                      {"setsDumbbell": num});
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
                            }),
                        SizedBox(
                          height: 30,
                          child: FutureBuilder<
                              DocumentSnapshot<Map<String, dynamic>>>(
                            future: FirebaseFirestore.instance
                                .collection("Pecho")
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
                                          "Change Reps",
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
                                                  hintText: "Reps",
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
                                              if (numSets.text.isEmpty ==
                                                  true) {
                                                num = 0;
                                              } else {
                                                num = int.parse(numSets.text);
                                              }
                                              final CollectionReference
                                                  collectionReference =
                                                  FirebaseFirestore.instance
                                                      .collection("Pecho");
                                              collectionReference
                                                  .doc(FirebaseAuth.instance
                                                      .currentUser!.email
                                                      .toString())
                                                  .update(
                                                      {"RepsDumbbell": num});
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
                            }),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Incline",
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
                                            keyboardType: TextInputType.number,
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
                                                  .collection("Pecho");
                                          collectionReference
                                              .doc(FirebaseAuth
                                                  .instance.currentUser!.email
                                                  .toString())
                                              .update({"setsIncline": num});
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            style:
                                ElevatedButton.styleFrom(primary: Colors.white),
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
                      child:
                          FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                        future: FirebaseFirestore.instance
                            .collection("Pecho")
                            .doc(FirebaseAuth.instance.currentUser!.email
                                .toString())
                            .get(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            var data = snapshot.data!.data();
                            var value = data!['setsIncline'];
                            var value2 = data['RepsIncline'];
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
                                    "Change Reps",
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
                                          keyboardType: TextInputType.number,
                                          controller: numSets,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                          decoration: const InputDecoration(
                                            hintText: "Reps",
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
                                                .collection("Pecho");
                                        collectionReference
                                            .doc(FirebaseAuth
                                                .instance.currentUser!.email
                                                .toString())
                                            .update({"RepsIncline": num});
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          style:
                              ElevatedButton.styleFrom(primary: Colors.white),
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
          ),
        ),
      ),
    ],
  );
}

Future<String> getPush() async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String existe = '';
  final document = await db
      .collection("Pecho")
      .doc(FirebaseAuth.instance.currentUser!.email.toString())
      .get();
  if (document.exists && document.get("Push Ups") == true) {
    existe = "Push Ups";
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Push",
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
                                                    fontWeight:
                                                        FontWeight.bold),
                                                decoration:
                                                    const InputDecoration(
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
                                              if (numSets.text.isEmpty ==
                                                  true) {
                                                num = 0;
                                              } else {
                                                num = int.parse(numSets.text);
                                              }
                                              final CollectionReference
                                                  collectionReference =
                                                  FirebaseFirestore.instance
                                                      .collection("Pecho");
                                              collectionReference
                                                  .doc(FirebaseAuth.instance
                                                      .currentUser!.email
                                                      .toString())
                                                  .update({"setsPush": num});
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
                            }),
                        SizedBox(
                          height: 30,
                          child: FutureBuilder<
                              DocumentSnapshot<Map<String, dynamic>>>(
                            future: FirebaseFirestore.instance
                                .collection("Pecho")
                                .doc(FirebaseAuth.instance.currentUser!.email
                                    .toString())
                                .get(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var data = snapshot.data!.data();
                                var value = data!['setsPush'];
                                var value2 = data['RepsPush'];
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
                                        "Change Reps",
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
                                                hintText: "Reps",
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
                                                    .collection("Pecho");
                                            collectionReference
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.email
                                                    .toString())
                                                .update({"RepsPush": num});
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
