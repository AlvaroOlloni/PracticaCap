import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Flexible(
        child: SizedBox(
          width: 410,
          height: 80,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      "Bench Press",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 20,
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
                              'Sets = $value Reps = $value2',
                              style: const TextStyle(
                                fontSize: 20,
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
          height: 80,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      "Cable Chest",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 20,
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
                            var value = data!['setsCable'];
                            var value2 = data['RepsCable'];
                            return Text(
                              'Sets = $value Reps = $value2',
                              style: const TextStyle(
                                fontSize: 20,
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
          height: 80,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      "Decline",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 20,
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
                            var value = data!['setsDips'];
                            var value2 = data['RepsDips'];
                            return Text(
                              'Sets = $value Reps = $value2',
                              style: const TextStyle(
                                fontSize: 18,
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
          height: 80,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      "Dips",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 20,
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
                            var value = data!['setsDips'];
                            var value2 = data['RepsDips'];
                            return Text(
                              'Sets = $value Reps = $value2',
                              style: const TextStyle(
                                fontSize: 18,
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
          height: 80,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      "Dumbbell",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 20,
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
                            var value = data!['setsDumbbell'];
                            var value2 = data['RepsDumbbell'];
                            return Text(
                              'Sets = $value Reps = $value2',
                              style: const TextStyle(
                                fontSize: 18,
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
          height: 80,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      "Incline",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 20,
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
                              'Sets = $value Reps = $value2',
                              style: const TextStyle(
                                fontSize: 18,
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
          height: 80,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      "Push",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 20,
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
                            var value = data!['setsPush'];
                            var value2 = data['RepsPush'];
                            return Text(
                              'Sets = $value Reps = $value2',
                              style: const TextStyle(
                                fontSize: 20,
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
