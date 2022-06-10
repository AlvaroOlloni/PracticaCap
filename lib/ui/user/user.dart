import 'package:flutter/material.dart';
import 'package:mi_app/ui/user/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      appBar: AppBar(
        title: Text(
          "Usuario",
          style: GoogleFonts.amaranth(
            textStyle: const TextStyle(fontSize: 30),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        titleTextStyle: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 255, 255, 255),
          //fontStyle: GoogleFonts.aBeeZee()
        ),
      ),
      */
      body: cuerpo(),
    );
  }
}
