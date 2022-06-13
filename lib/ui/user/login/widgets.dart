import 'package:flutter/material.dart';
import 'package:mi_app/ui/navigation/nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mi_app/ui/user/register/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

final usuario = TextEditingController();

final password = TextEditingController();

String usu = '';
String pass = '';

Widget cuerpo() {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage("fondo_home4.png"),
        fit: BoxFit.cover,
      ),
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 50.0,
          ),
          const SizedBox(
            height: 50.0,
          ),
          campoUsuario(),
          const SizedBox(
            height: 10.0,
          ),
          campoContrasena(),
          const SizedBox(
            height: 10.0,
          ),
          botonEntrar(),
          const SizedBox(
            height: 10.0,
          ),
          botonAbrirRegistrar(),
        ],
      ),
    ),
  );
}

Widget campoUsuario() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: TextField(
      controller: usuario,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      decoration: const InputDecoration(
        hintText: "Email",
        fillColor: Color.fromARGB(99, 27, 38, 44),
        filled: true,
        hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ),
  );
}

Widget campoContrasena() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: TextField(
      controller: password,
      obscureText: true,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      decoration: const InputDecoration(
        hintText: "Password",
        fillColor: Color.fromARGB(99, 27, 38, 44),
        filled: true,
        hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ),
  );
}

Widget botonEntrar() {
  return StreamBuilder(
      stream: null,
      builder: (context, snapshot) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 4,
            shadowColor: Colors.white,
            primary: const Color.fromARGB(255, 255, 123, 0),
          ),
          onPressed: () async {
            usu = usuario.text;
            pass = password.text;

            //Crear un usuario nuevo
            //Cambiar por LogIn y poner este método en Register.dart
            try {
              await FirebaseAuth.instance
                  .signInWithEmailAndPassword(email: usu, password: pass);
              // ignore: avoid_print
              print("Usuario logueado");
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setString(usu, pass);

              if (FirebaseAuth.instance.currentUser != null) {
                // ignore: use_build_context_synchronously
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NavScreen(),
                  ),
                  (route) => false,
                );
                usuario.clear();
                password.clear();
              }
            } on FirebaseAuthException catch (e) {
              if (e.code == 'weak-password') {
                // ignore: avoid_print
                print('The password provided is too weak.');
              } else if (e.code == 'email-already-in-use') {
                // ignore: avoid_print
                print('The account already exists for that email.');
              }
            } catch (e) {
              // ignore: avoid_print
              print(e);
            }

            /*
          FirebaseFirestore db;
  
          final usuarios = <String, String>{
            "name": usu,
            "state": "CA",
            "country": "USA"
          };
          */
          },
          child: const Text(
            "Go",
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        );
      });
}

Widget botonAbrirRegistrar() {
  return StreamBuilder(
      stream: null,
      builder: (context, snapshot) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 4,
            shadowColor: Colors.white,
            primary: const Color.fromARGB(255, 255, 123, 0),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RegisterScreen(),
              ),
            );
            usuario.clear();
            password.clear();
          },
          child: const Text(
            "Register",
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        );
      });
}
