import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shadowColor: Colors.black,
        elevation: 10,
        centerTitle: true,
        title: Text(
          "LOG IN",
          style: GoogleFonts.blackHanSans(
            color: Colors.white,
            fontSize: 40,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 47, 71, 81),
      ),
      body: cuerpo(),
    );
  }
}
