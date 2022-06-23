import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<String> getBarbell() async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String existe = '';
  final document = await db
      .collection("Brazo")
      .doc(FirebaseAuth.instance.currentUser!.email.toString())
      .get();
  if (document.exists && document.get("Barbell biceps curl") == true) {
    existe = "Barbell biceps curl";
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
                          "Barbell biceps curl",
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
                                                    .collection("Brazo");
                                            collectionReference
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.email
                                                    .toString())
                                                .update({"setsBarbell": num});
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
                                .collection("Brazo")
                                .doc(FirebaseAuth.instance.currentUser!.email
                                    .toString())
                                .get(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var data = snapshot.data!.data();
                                var value = data!['setsBarbell'];
                                var value2 = data['RepsBarbell'];
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
                                                    .collection("Brazo");
                                            collectionReference
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.email
                                                    .toString())
                                                .update({"RepsBarbell": num});
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

Future<String> getpreacher() async {
  String existe = '';
  final document = await FirebaseFirestore.instance
      .collection("Brazo")
      .doc(FirebaseAuth.instance.currentUser!.email.toString())
      .get();
  if (document.exists && document.get("Preacher biceps curl") == true) {
    existe = "Preacher biceps curl";
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
                          "Preacher biceps curl",
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
                                                    .collection("Brazo");
                                            collectionReference
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.email
                                                    .toString())
                                                .update({"setsPreacher": num});
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
                                .collection("Brazo")
                                .doc(FirebaseAuth.instance.currentUser!.email
                                    .toString())
                                .get(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var data = snapshot.data!.data();
                                var value = data!['setsPreacher'];
                                var value2 = data['RepsPreacher'];
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
                                                    .collection("Brazo");
                                            collectionReference
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.email
                                                    .toString())
                                                .update({"RepsPreacher": num});
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

Future<String> getCableBiceps() async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String existe = '';
  final document = await db
      .collection("Brazo")
      .doc(FirebaseAuth.instance.currentUser!.email.toString())
      .get();
  if (document.exists && document.get("Cable biceps curl") == true) {
    existe = "Cable biceps curl";
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
                          "Cable biceps curl",
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
                                                    .collection("Brazo");
                                            collectionReference
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.email
                                                    .toString())
                                                .update(
                                                    {"setsCableBiceps": num});
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
                                .collection("Brazo")
                                .doc(FirebaseAuth.instance.currentUser!.email
                                    .toString())
                                .get(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var data = snapshot.data!.data();
                                var value = data!['setsCableBiceps'];
                                var value2 = data['RepsCableBiceps'];
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
                                                    .collection("Brazo");
                                            collectionReference
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.email
                                                    .toString())
                                                .update(
                                                    {"RepsCableBiceps": num});
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

Future<String> getCableTriceps() async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String existe = '';
  final document = await db
      .collection("Brazo")
      .doc(FirebaseAuth.instance.currentUser!.email.toString())
      .get();
  if (document.exists && document.get("Cable triceps pushdown") == true) {
    existe = "Cable triceps pushdown";
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
                          "Cable triceps pushdown",
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
                                                    .collection("Brazo");
                                            collectionReference
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.email
                                                    .toString())
                                                .update(
                                                    {"setsCableTriceps": num});
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
                                .collection("Brazo")
                                .doc(FirebaseAuth.instance.currentUser!.email
                                    .toString())
                                .get(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var data = snapshot.data!.data();
                                var value = data!['setsCableTriceps'];
                                var value2 = data['RepsCableTriceps'];
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
                                                    .collection("Brazo");
                                            collectionReference
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.email
                                                    .toString())
                                                .update(
                                                    {"RepsCableTriceps": num});
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

Future<String> getDips() async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String existe = '';
  final document = await db
      .collection("Brazo")
      .doc(FirebaseAuth.instance.currentUser!.email.toString())
      .get();
  if (document.exists && document.get("Dips") == true) {
    existe = "Dips";
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
                          "Dips",
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
                                                    .collection("Brazo");
                                            collectionReference
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.email
                                                    .toString())
                                                .update({"setsDips": num});
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
                                .collection("Brazo")
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
                                                    .collection("Brazo");
                                            collectionReference
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.email
                                                    .toString())
                                                .update({"RepsDips": num});
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

Future<String> getOverhead() async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String existe = '';
  final document = await db
      .collection("Brazo")
      .doc(FirebaseAuth.instance.currentUser!.email.toString())
      .get();
  if (document.exists && document.get("Overhead Triceps Extensions") == true) {
    existe = "Overhead Triceps Extensions";
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
                          "Overhead Triceps Extensions",
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
                                                    .collection("Brazo");
                                            collectionReference
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.email
                                                    .toString())
                                                .update({"setsOverhead": num});
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
                                .collection("Brazo")
                                .doc(FirebaseAuth.instance.currentUser!.email
                                    .toString())
                                .get(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var data = snapshot.data!.data();
                                var value = data!['setsOverhead'];
                                var value2 = data['RepsOverhead'];
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
                                                    .collection("Brazo");
                                            collectionReference
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.email
                                                    .toString())
                                                .update({"RepsOverhead": num});
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

Future<String> getCloseGrip() async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String existe = '';
  final document = await db
      .collection("Brazo")
      .doc(FirebaseAuth.instance.currentUser!.email.toString())
      .get();
  if (document.exists && document.get("Close Grip Bench Presses") == true) {
    existe = "Close Grip Bench Presses";
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
                          "Close Grip Bench Presses",
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
                                                    .collection("Brazo");
                                            collectionReference
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.email
                                                    .toString())
                                                .update(
                                                    {"setsCloseGrips": num});
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
                                .collection("Brazo")
                                .doc(FirebaseAuth.instance.currentUser!.email
                                    .toString())
                                .get(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var data = snapshot.data!.data();
                                var value = data!['setsCloseGrips'];
                                var value2 = data['RepsCloseGrip'];
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
                                                    .collection("Brazo");
                                            collectionReference
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.email
                                                    .toString())
                                                .update(
                                                    {"RepsCloseGrips": num});
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
