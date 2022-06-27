import 'package:flutter/material.dart';
import 'package:mi_app/ui/navigation/nav.dart';
import 'package:mi_app/ui/user/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? finalEmail;

class Check extends StatefulWidget {
  @override
  State<Check> createState() => _CheckState();
}

class _CheckState extends State<Check> {
  @override
  void initState() {
    getValidationData().whenComplete(() async {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return finalEmail == null ? const Inicio() : const NavScreen();
          },
        ),
      );
    });
    super.initState();
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String? obtainedEmail = sharedPreferences.getString('email');
    setState(() {
      finalEmail = obtainedEmail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 37, 149, 190),
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Center(
        child: Container(
          color: const Color.fromARGB(255, 37, 149, 190),
          child: const CircularProgressIndicator(color: Colors.black),
        ),
      ),
    );
  }
}
