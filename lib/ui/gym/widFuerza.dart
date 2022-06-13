import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../navigation/nav.dart';

Widget botonStrength() {
  return StreamBuilder(
      stream: null,
      builder: (context, snapshot) {
        return SizedBox(
          width: 400,
          height: 178,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: Color.fromARGB(0, 255, 255, 255),
              //backgroundColor: const Color.fromARGB(255, 207, 40, 231),
              side: const BorderSide(
                color: Color.fromARGB(255, 255, 255, 255),
                width: 2,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NavScreen(),
                ),
              );
            },
            child: Text(
              "Strength",
              style: GoogleFonts.blackHanSans(
                  fontSize: 30, color: Color.fromARGB(0, 0, 0, 0)),
            ),
          ),
        );
      });
}

Widget cardFuerza() {
  return SizedBox(
    height: 180,
    width: 400,
    child: Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          image: const DecorationImage(
            image: AssetImage("fuerza.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
  );
}
