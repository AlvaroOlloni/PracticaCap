import 'package:flutter/material.dart';
import 'package:mi_app/ui/gym/fuerza/getData.dart';

class MostrarFuerzaScreen extends StatefulWidget {
  const MostrarFuerzaScreen({Key? key}) : super(key: key);

  @override
  State<MostrarFuerzaScreen> createState() => _MostrarFuerzaScreenState();
}

class _MostrarFuerzaScreenState extends State<MostrarFuerzaScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ejercicios Seleccionados',
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Selected',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        body: Column(
          children: [
            FutureBuilder(
              future: getBenchPress(),
              builder: ((context, snapshot) {
                if (snapshot.data == "Bench Press") {
                  return card();
                } else {
                  return const SizedBox();
                }
              }),
            ),
            FutureBuilder(
              future: getCableChest(),
              builder: ((context, snapshot) {
                if (snapshot.data == "Cable Chest") {
                  return card2();
                } else {
                  return const SizedBox();
                }
              }),
            ),
            FutureBuilder(
              future: getDecline(),
              builder: ((context, snapshot) {
                if (snapshot.data == "Decline") {
                  return card3();
                } else {
                  return const SizedBox();
                }
              }),
            ),
            FutureBuilder(
              future: getDips(),
              builder: ((context, snapshot) {
                if (snapshot.data == "Dips") {
                  return card4();
                } else {
                  return const SizedBox();
                }
              }),
            ),
            FutureBuilder(
              future: getDumbbell(),
              builder: ((context, snapshot) {
                if (snapshot.data == "Dumbbell Flyes") {
                  return card5();
                } else {
                  return const SizedBox();
                }
              }),
            ),
            FutureBuilder(
              future: getIncline(),
              builder: ((context, snapshot) {
                if (snapshot.data == "Incline") {
                  return card6();
                } else {
                  return const SizedBox();
                }
              }),
            ),
            FutureBuilder(
              future: getPush(),
              builder: ((context, snapshot) {
                if (snapshot.data == "Push Ups") {
                  return card7();
                } else {
                  return const SizedBox();
                }
              }),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(backgroundColor: Colors.white),
              child: const Text(
                "Go back",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
