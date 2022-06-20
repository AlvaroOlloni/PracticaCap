import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mi_app/ui/navigation/account/widgets.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
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
            height: 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              cardName2(),
            ],
          ),
        ],
      ),
    );
  }
}

Widget cardName2() {
  return Flexible(
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        image: const DecorationImage(
          image: AssetImage("fondo_home3.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      width: 340,
      height: 190,
      child: Card(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadowColor: Colors.black,
        elevation: 400,
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.person,
                      size: 100,
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Username:',
                          style: GoogleFonts.blackHanSans(
                            textStyle: const TextStyle(fontSize: 30),
                            fontSize: 30,
                            color: Colors.black,
                          ),
                        ),
                        FutureBuilder<String>(
                          future: getName(),
                          builder: (context, snapshot) => Text(
                            snapshot.hasData ? snapshot.data! : "",
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            textWidthBasis: TextWidthBasis.parent,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [botonModificar(), botonSalir()],
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

StreamBuilder<Object> botonModificar() {
  return StreamBuilder<Object>(
    stream: null,
    builder: (context, snapshot) {
      return SizedBox(
        width: 100,
        height: 60,
        child: OutlinedButton(
          onPressed: () => {createAlertDialog(context)},
          style: OutlinedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            side: const BorderSide(
              color: Color.fromARGB(255, 0, 0, 0),
              width: 6,
            ),
            elevation: 5,
            shadowColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text(
            'Change',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
      );
    },
  );
}
