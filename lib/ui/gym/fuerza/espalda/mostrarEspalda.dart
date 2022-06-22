import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mi_app/ui/gym/fuerza/espalda/getDataEspalda.dart';

class MostrarEspaldaScreen extends StatefulWidget {
  const MostrarEspaldaScreen({Key? key}) : super(key: key);

  @override
  State<MostrarEspaldaScreen> createState() => _MostrarEspaldaScreenState();
}

class _MostrarEspaldaScreenState extends State<MostrarEspaldaScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ejercicios Seleccionados',
      home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("fondo_home6.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Flexible(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  FutureBuilder(
                    future: getDeadLift(),
                    builder: ((context, snapshot) {
                      if (snapshot.data == "Dead Lift") {
                        return card();
                      } else {
                        return const SizedBox();
                      }
                    }),
                  ),
                  FutureBuilder(
                    future: getDumbbellPull(),
                    builder: ((context, snapshot) {
                      if (snapshot.data == "Dumbbell Pull Over") {
                        return card2();
                      } else {
                        return const SizedBox();
                      }
                    }),
                  ),
                  FutureBuilder(
                    future: getPullDown(),
                    builder: ((context, snapshot) {
                      if (snapshot.data == "Pull Down") {
                        return card3();
                      } else {
                        return const SizedBox();
                      }
                    }),
                  ),
                  FutureBuilder(
                    future: getPullUps(),
                    builder: ((context, snapshot) {
                      if (snapshot.data == "Pull Ups") {
                        return card7();
                      } else {
                        return const SizedBox();
                      }
                    }),
                  ),
                  FutureBuilder(
                    future: getPullOver(),
                    builder: ((context, snapshot) {
                      if (snapshot.data == "Pull over") {
                        return card4();
                      } else {
                        return const SizedBox();
                      }
                    }),
                  ),
                  FutureBuilder(
                    future: getSeatedRow(),
                    builder: ((context, snapshot) {
                      if (snapshot.data == "Seated Row") {
                        return card5();
                      } else {
                        return const SizedBox();
                      }
                    }),
                  ),
                  FutureBuilder(
                    future: getSingleArm(),
                    builder: ((context, snapshot) {
                      if (snapshot.data == "Single Arm") {
                        return card6();
                      } else {
                        return const SizedBox();
                      }
                    }),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 75,
              width: 300,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style:
                    TextButton.styleFrom(backgroundColor: Colors.transparent),
                child: Text(
                  "Go back",
                  style: GoogleFonts.blackHanSans(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            )
          ],
        ),
      ),
    );
  }
}
