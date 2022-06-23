import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mi_app/ui/gym/fuerza/pecho/getDataPecho.dart';

class MostrarPechoScreen extends StatefulWidget {
  const MostrarPechoScreen({Key? key}) : super(key: key);

  @override
  State<MostrarPechoScreen> createState() => _MostrarPechoScreenState();
}

class _MostrarPechoScreenState extends State<MostrarPechoScreen> {
  @override
  Widget build(BuildContext context) {
    Future<void>.delayed(const Duration(seconds: 0)).then(
      (value) {
        setState(() {
          const MostrarPechoScreen();
        });
      },
    );
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
