import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mi_app/ui/gym/fuerza/escogerOpcion/widFuerza.dart';
import 'package:mi_app/ui/gym/fuerza/escogerOpcion/widCardio.dart';
import 'package:mi_app/ui/gym/fuerza/escogerOpcion/widDieta.dart';

class GymScreen extends StatelessWidget {
  const GymScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("fondo_home3.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height * 0.32,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(0, 199, 199, 199),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                        bottomRight: Radius.circular(36),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 53,
                    left: 5,
                    right: 5,
                    child: cardFuerza(),
                  ),
                  Positioned(
                    top: 53,
                    left: 7,
                    right: 7,
                    child: botonStrength(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.3,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(0, 0, 0, 0),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                        bottomRight: Radius.circular(36),
                        topLeft: Radius.circular(36),
                        topRight: Radius.circular(36),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 5,
                    right: 5,
                    child: cardCardio(),
                  ),
                  Positioned(
                    top: 32,
                    left: 7,
                    right: 7,
                    child: botonCardio(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.3,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(0, 0, 0, 0),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                        bottomRight: Radius.circular(36),
                        topLeft: Radius.circular(36),
                        topRight: Radius.circular(36),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 5,
                    right: 5,
                    child: cardDieta(),
                  ),
                  Positioned(
                    top: 32,
                    left: 7,
                    right: 7,
                    child: botonDieta(),
                  ),
                ],
              ),
            ),
            StreamBuilder<Object>(
              stream: null,
              builder: (context, snapshot) {
                return OutlinedButton(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    elevation: 4,
                    shadowColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 213, 2, 255),
                    side: const BorderSide(
                      color: Color.fromARGB(255, 0, 0, 0),
                      width: 3,
                    ),
                  ),
                  child: Text(
                    "Go Back",
                    style: GoogleFonts.blackHanSans(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
