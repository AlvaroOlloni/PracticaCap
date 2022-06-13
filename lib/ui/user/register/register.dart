import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../register/widgets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shadowColor: Colors.black,
        elevation: 10,
        centerTitle: true,
        title: Text(
          "SIGN UP",
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
