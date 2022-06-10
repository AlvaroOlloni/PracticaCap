import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mi_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mi_app/ui/login/login.dart';

final userName = TextEditingController();

final usuario = TextEditingController();

final password = TextEditingController();

String name = ' ';
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
            titulo(),
            const SizedBox(
              height: 50.0,
            ),
            campoUserName(),
            const SizedBox(
              height: 10.0,
            ),
            campoEmail(),
            const SizedBox(
              height: 10.0,
            ),
            campoPassword(),
            const SizedBox(
              height: 10.0,
            ),
            botonRegistrar(),
            const SizedBox(
              height: 10.0,
            ),
            botonVolver(),
          ]),
    ),
  );
}

Widget titulo() {
  return const Text(
    "Regístrate",
    style: TextStyle(
      color: Colors.white,
      fontSize: 35.0,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget campoUserName() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: TextField(
      controller: userName,
      decoration: const InputDecoration(
        hintText: "Nombre de usuario",
        fillColor: Colors.white,
        filled: true,
      ),
    ),
  );
}

Widget campoEmail() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: TextField(
      controller: usuario,
      decoration: const InputDecoration(
        hintText: "Email",
        fillColor: Colors.white,
        filled: true,
      ),
    ),
  );
}

Widget campoPassword() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: TextField(
      controller: password,
      obscureText: true,
      decoration: const InputDecoration(
        hintText: "Password",
        fillColor: Colors.white,
        filled: true,
      ),
    ),
  );
}

Widget botonRegistrar() {
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
            name = userName.text;
            usu = usuario.text;
            pass = password.text;

            //Crear un usuario nuevo
            //Cambiar por LogIn y poner este método en Register.dart
            try {
              await FirebaseAuth.instance
                  .createUserWithEmailAndPassword(email: usu, password: pass);
              // ignore: avoid_print
              print("Usuario registrado");
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
            crearDataUsuario();
          },
          child: const Text(
            "Entrar",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        );
      });
}

void crearDataUsuario() {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  final data = <String, String>{"Username": name};

  users.doc(usu).set(data);
}

Widget botonVolver() {
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
                builder: (context) => const Inicio(),
              ),
            );
          },
          child: const Text(
            "Volver",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        );
      });
}
