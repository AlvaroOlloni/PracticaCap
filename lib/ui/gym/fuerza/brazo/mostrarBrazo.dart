import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mi_app/ui/gym/fuerza/brazo/getDataBrazo.dart';

class MostrarBrazoScreen extends StatefulWidget {
  const MostrarBrazoScreen({Key? key}) : super(key: key);

  @override
  State<MostrarBrazoScreen> createState() => _MostrarBrazoScreenState();
}

class _MostrarBrazoScreenState extends State<MostrarBrazoScreen> {
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
                    future: getBarbell(),
                    builder: ((context, snapshot) {
                      if (snapshot.data == "Barbell biceps curl") {
                        return card();
                      } else {
                        return const SizedBox();
                      }
                    }),
                  ),
                  FutureBuilder(
                    future: getCableTriceps(),
                    builder: ((context, snapshot) {
                      if (snapshot.data == "Cable triceps pushdown") {
                        return card4();
                      } else {
                        return const SizedBox();
                      }
                    }),
                  ),
                  FutureBuilder(
                    future: getCableBiceps(),
                    builder: ((context, snapshot) {
                      if (snapshot.data == "Cable biceps curl") {
                        return card3();
                      } else {
                        return const SizedBox();
                      }
                    }),
                  ),
                  FutureBuilder(
                    future: getCloseGrip(),
                    builder: ((context, snapshot) {
                      if (snapshot.data == "Close Grip Bench Presses") {
                        return card7();
                      } else {
                        return const SizedBox();
                      }
                    }),
                  ),
                  FutureBuilder(
                    future: getDips(),
                    builder: ((context, snapshot) {
                      if (snapshot.data == "Dips") {
                        return card5();
                      } else {
                        return const SizedBox();
                      }
                    }),
                  ),
                  FutureBuilder(
                    future: getOverhead(),
                    builder: ((context, snapshot) {
                      if (snapshot.data == "Overhead Triceps Extensions") {
                        return card6();
                      } else {
                        return const SizedBox();
                      }
                    }),
                  ),
                  FutureBuilder(
                    future: getpreacher(),
                    builder: ((context, snapshot) {
                      if (snapshot.data == "Preacher biceps curl") {
                        return card2();
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
