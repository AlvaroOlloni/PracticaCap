import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mi_app/ui/gym/gym.dart';
import 'package:mi_app/ui/navigation/home/widgets.dart';
import 'package:page_transition/page_transition.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("fondo_home3.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 100,
            child: Text(""),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              cardNotes(),
            ],
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
              color: Color.fromARGB(255, 63, 69, 255)),
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
    child: SizedBox(
      width: 320,
      height: 190,
      child: Card(
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Color.fromARGB(255, 255, 255, 255),
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
    child: SizedBox(
      width: 250,
      height: 190,
      child: Card(
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.white,
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
                      color: const Color.fromARGB(255, 63, 69, 255)),
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
            backgroundColor: const Color.fromARGB(255, 207, 40, 231),
            side: const BorderSide(
              color: Color.fromARGB(255, 63, 69, 255),
              width: 6,
            ),
            elevation: 4,
            shadowColor: const Color.fromARGB(255, 220, 52, 55),
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
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
      );
    },
  );
}
