import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({Key? key}) : super(key: key);

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 34, 33, 33),
      appBar: AppBar(
        title: Text(
          "Notes created",
          style: GoogleFonts.amaranth(
            textStyle: const TextStyle(fontSize: 30),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 34, 33, 33),
        shadowColor: Colors.white,
        elevation: 4,
        titleTextStyle: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Flexible(child: consultaFirestore()),
          ],
        ),
      ),
    );
  }
}

Widget consultaFirestore() {
  return StreamBuilder(
    stream: FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser!.email.toString())
        .snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (!snapshot.hasData) return const CircularProgressIndicator();
      return ListView.builder(
        itemCount: snapshot.data?.docs.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Colors.yellow,
            shadowColor: Colors.white,
            elevation: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  snapshot.data!.docs[index].get("titulo"),
                  style: GoogleFonts.amaranth(
                    textStyle: const TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  snapshot.data!.docs[index].get("contenido"),
                  style: GoogleFonts.amaranth(
                    textStyle: const TextStyle(fontSize: 25),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: OutlinedButton(
                        onPressed: () {
                          try {
                            FirebaseFirestore.instance
                                .collection(
                                  FirebaseAuth.instance.currentUser!.email
                                      .toString(),
                                )
                                .doc(snapshot.data!.docs[index].id)
                                .delete();
                          } catch (e) {
                            print(e);
                          }
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(
                            color: Color.fromARGB(250, 21, 21, 21),
                            width: 3,
                          ),
                          elevation: 4,
                          shadowColor: const Color.fromARGB(255, 220, 52, 55),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          "Eliminar",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      );
    },
  );
}
