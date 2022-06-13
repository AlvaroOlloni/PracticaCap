import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mi_app/ui/notes/add/widgets.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shadowColor: Colors.black,
        elevation: 10,
        centerTitle: true,
        title: Text(
          "Add notes",
          style: GoogleFonts.blackHanSans(
            color: Colors.white,
            fontSize: 40,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 0, 128),
      ),
      body: cuerpo(),
    );
  }
}
