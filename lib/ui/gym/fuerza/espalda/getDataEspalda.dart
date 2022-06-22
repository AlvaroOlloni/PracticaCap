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
          height: 100,
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
                    SizedBox(
                      height: 40,
                      child:
                          FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
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
          height: 100,
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
                    SizedBox(
                      height: 40,
                      child:
                          FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
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
          height: 100,
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
                    SizedBox(
                      height: 40,
                      child:
                          FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                        future: FirebaseFirestore.instance
                            .collection("Espalda")
                            .doc(FirebaseAuth.instance.currentUser!.email
                                .toString())
                            .get(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            var data = snapshot.data!.data();
                            var value = data!['setsPull'];
                            var value2 = data['RepsPull'];
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
          height: 100,
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
                    SizedBox(
                      height: 40,
                      child:
                          FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
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
          height: 100,
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
                    SizedBox(
                      height: 40,
                      child:
                          FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
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
          height: 100,
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
                    SizedBox(
                      height: 40,
                      child:
                          FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
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
          height: 100,
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
                    SizedBox(
                      height: 40,
                      child:
                          FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                        future: FirebaseFirestore.instance
                            .collection("Espalda")
                            .doc(FirebaseAuth.instance.currentUser!.email
                                .toString())
                            .get(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            var data = snapshot.data!.data();
                            var value = data!['setsPull'];
                            var value2 = data['RepsPull'];
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
