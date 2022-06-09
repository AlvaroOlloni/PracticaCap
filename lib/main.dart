import 'package:flutter/material.dart';
import 'package:mi_app/ui/home/home.dart';
import 'package:mi_app/ui/user/user.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MiApp());
}

class MiApp extends StatefulWidget {
  const MiApp({Key? key}) : super(key: key);

  @override
  State<MiApp> createState() => _MiAppState();
}

class _MiAppState extends State<MiApp> {
  int _paginaActual = 0;

  final List<Widget> _paginas = [const Home(), UserScreen()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        body: _paginas[_paginaActual],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.blue,
          onTap: (index) {
            setState(() {
              _paginaActual = index;
            });
          },
          currentIndex: _paginaActual,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle),
              label: "Users",
            )
          ],
        ),
      ),
    );
  }
}
