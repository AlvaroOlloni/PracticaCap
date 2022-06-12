import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mi_app/ui/home/widgets.dart';

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
        )
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
          borderRadius: BorderRadius.circular(50),
        ),
        color: Colors.white,
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
