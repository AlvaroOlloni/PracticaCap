import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mi_app/ui/home/widgets.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      appBar: AppBar(
        title: Text(
          "Home",
          style: GoogleFonts.amaranth(
            textStyle: const TextStyle(fontSize: 30),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        titleTextStyle: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      */
      body: cuerpo(),
    );
  }
}
