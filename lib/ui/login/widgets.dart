import 'package:flutter/material.dart';
import 'package:mi_app/ui/nav.dart';
import 'package:mi_app/ui/register/register.dart';
import 'package:firebase_auth/firebase_auth.dart';

final usuario = TextEditingController();

final password = TextEditingController();

String usu = '';
String pass = '';

Widget cuerpo() {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(
            "https://i.pinimg.com/originals/30/79/a2/3079a2b472e0ea0aa2667a2994fe6689.jpg"),
        fit: BoxFit.cover,
      ),
    ),
    child: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            nombre(),
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
          ]),
    ),
  );
}

Widget nombre() {
  return const Text(
    "Iniciar Sesión",
    style: TextStyle(
      color: Colors.white,
      fontSize: 35.0,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget campoUsuario() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: TextField(
      controller: usuario,
      decoration: const InputDecoration(
        hintText: "Usuario",
        fillColor: Colors.white,
        filled: true,
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
      decoration: const InputDecoration(
        hintText: "Contraseña",
        fillColor: Colors.white,
        filled: true,
      ),
    ),
  );
}

Widget botonEntrar() {
  return StreamBuilder(
      stream: null,
      builder: (context, snapshot) {
        return TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 5.0, horizontal: 100.0),
            ),
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
              if (FirebaseAuth.instance.currentUser != null) {
                // ignore: use_build_context_synchronously
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NavScreen(),
                  ),
                  (route) => false,
                );
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
            "Entrar",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        );
      });
}

Widget botonAbrirRegistrar() {
  return StreamBuilder(
      stream: null,
      builder: (context, snapshot) {
        return TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 5.0, horizontal: 100.0),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RegisterScreen(),
              ),
            );
          },
          child: const Text(
            "Registrarse",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        );
      });
}
