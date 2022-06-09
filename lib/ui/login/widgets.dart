import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:mi_app/main.dart';
import 'package:mi_app/ui/home/home.dart';
import 'package:mi_app/ui/register/register.dart';
import 'login.dart';
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
              print("Usuario logueado");
              if (FirebaseAuth.instance.currentUser != null) {
                // ignore: use_build_context_synchronously
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MiApp(),
                  ),
                );
              }
            } on FirebaseAuthException catch (e) {
              if (e.code == 'weak-password') {
                print('The password provided is too weak.');
              } else if (e.code == 'email-already-in-use') {
                print('The account already exists for that email.');
              }
            } catch (e) {
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
