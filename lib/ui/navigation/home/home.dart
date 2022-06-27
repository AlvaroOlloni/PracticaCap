import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mi_app/ui/gym/fuerza/escogerOpcion/gym.dart';
import 'package:mi_app/ui/navigation/home/widgets.dart';
import 'package:page_transition/page_transition.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("fondo_home6.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              cardNotes(),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          cardGym()
        ],
      ),
    );
  }
}

Widget notesText() {
  return Flexible(
    child: Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          "Notes",
          style: GoogleFonts.blackHanSans(
            textStyle: const TextStyle(fontSize: 30),
            fontSize: 50,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ],
    ),
  );
}

Widget notesAdd() {
  return Flexible(
    fit: FlexFit.loose,
    child: Column(
      children: [botonAdd()],
    ),
  );
}

Widget notesView() {
  return Flexible(
    fit: FlexFit.loose,
    child: Column(
      children: [
        botonVer(),
      ],
    ),
  );
}

Widget cardNotes() {
  return Flexible(
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        image: const DecorationImage(
          image: AssetImage("fondo_home3.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      width: 320,
      height: 190,
      child: Card(
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Color.fromARGB(0, 255, 255, 255),
        elevation: 20,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.note_outlined,
                  size: 80,
                ),
                notesText(),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                notesAdd(),
                notesView(),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget cardGym() {
  return Flexible(
    child: Container(
      width: 400,
      height: 450,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        image: const DecorationImage(
          image: AssetImage("fondo_home3.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Card(
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: const Color.fromARGB(0, 255, 255, 255),
        elevation: 20,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.sports_gymnastics_rounded,
                  size: 80,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "Gym",
                  style: GoogleFonts.blackHanSans(
                      textStyle: const TextStyle(fontSize: 30),
                      fontSize: 50,
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                gymView(),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget gymView() {
  return Flexible(
    fit: FlexFit.loose,
    child: Column(
      children: [
        botonVerGym(),
      ],
    ),
  );
}

Widget botonVerGym() {
  return StreamBuilder(
    stream: null,
    builder: (context, snapshot) {
      return SizedBox(
        width: 100,
        height: 60,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            side: const BorderSide(
              color: Color.fromARGB(255, 0, 0, 0),
              width: 6,
            ),
            elevation: 4,
            shadowColor: Color.fromARGB(255, 255, 255, 255),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.topToBottom,
                child: const GymScreen(),
              ),
            );
          },
          child: const Text(
            "Go",
            style: TextStyle(fontSize: 25, color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
      );
    },
  );
}
