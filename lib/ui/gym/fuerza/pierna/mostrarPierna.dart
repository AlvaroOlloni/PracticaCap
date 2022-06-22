import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mi_app/ui/gym/fuerza/pierna/getDataPierna.dart';

class MostrarPiernaScreen extends StatefulWidget {
  const MostrarPiernaScreen({Key? key}) : super(key: key);

  @override
  State<MostrarPiernaScreen> createState() => _MostrarPiernaScreenState();
}

class _MostrarPiernaScreenState extends State<MostrarPiernaScreen> {
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
                      if (snapshot.data == "DeadLift") {
                        return card();
                      } else {
                        return const SizedBox();
                      }
                    }),
                  ),
                  FutureBuilder(
                    future: getLegPress(),
                    builder: ((context, snapshot) {
                      if (snapshot.data == "Leg press") {
                        return card2();
                      } else {
                        return const SizedBox();
                      }
                    }),
                  ),
                  FutureBuilder(
                    future: getHamstring(),
                    builder: ((context, snapshot) {
                      if (snapshot.data == "Seated hamstring curl") {
                        return card3();
                      } else {
                        return const SizedBox();
                      }
                    }),
                  ),
                  FutureBuilder(
                    future: getSeatedLeg(),
                    builder: ((context, snapshot) {
                      if (snapshot.data == "Seated leg extension") {
                        return card4();
                      } else {
                        return const SizedBox();
                      }
                    }),
                  ),
                  FutureBuilder(
                    future: getDumbbell(),
                    builder: ((context, snapshot) {
                      if (snapshot.data == "Dumbbell lunge") {
                        return card5();
                      } else {
                        return const SizedBox();
                      }
                    }),
                  ),
                  FutureBuilder(
                    future: getSquats(),
                    builder: ((context, snapshot) {
                      if (snapshot.data == "Squats") {
                        return card6();
                      } else {
                        return const SizedBox();
                      }
                    }),
                  ),
                  FutureBuilder(
                    future: getSingleLeg(),
                    builder: ((context, snapshot) {
                      if (snapshot.data == "Single leg curl") {
                        return card7();
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
