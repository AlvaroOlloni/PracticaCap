import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mi_app/ui/navigation/account/user.dart';
import 'package:mi_app/ui/navigation/home/home.dart';
import 'package:mi_app/ui/user/login/login.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  @override
  void initState() {
    super.initState();

    if (FirebaseAuth.instance.currentUser == null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Inicio(),
        ),
      );
    }
  }

  int _paginaActual = 0;

  final List<Widget> _paginas = [const Home(), const UserScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _paginas[_paginaActual],
      bottomNavigationBar: myBottomNav(),
    );
  }

  Widget myBottomNav() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color.fromARGB(255, 8, 123, 185),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      iconSize: 30,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      unselectedFontSize: 0,
      selectedFontSize: 0,
      elevation: 0,
      onTap: (index) {
        setState(() {
          _paginaActual = index;
        });
      },
      currentIndex: _paginaActual,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.supervised_user_circle,
          ),
          label: "Users",
        )
      ],
    );
  }
}
