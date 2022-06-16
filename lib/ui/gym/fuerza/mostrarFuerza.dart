import 'package:flutter/material.dart';
import 'package:mi_app/ui/gym/fuerza/pecho.dart';

class MostrarFuerzaScreen extends StatefulWidget {
  const MostrarFuerzaScreen({Key? key}) : super(key: key);

  @override
  State<MostrarFuerzaScreen> createState() => _MostrarFuerzaScreenState();
}

class _MostrarFuerzaScreenState extends State<MostrarFuerzaScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                card1(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget card1() {
  return Flexible(
    child: SizedBox(
      width: 410,
      height: 80,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                FutureBuilder<String>(
                  future: getBenchPress(),
                  builder: (context, snapshot) => Text(
                    snapshot.hasData ? snapshot.data! : "",
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0)),
                    textWidthBasis: TextWidthBasis.parent,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
/*FutureBuilder<String>(
          future: getBenchPress(),
          builder: (context, snapshot) => Text(
            snapshot.hasData ? snapshot.data! : "",
            style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0)),
            textWidthBasis: TextWidthBasis.parent,
          ),
        )
        */
