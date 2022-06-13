import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mi_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mi_app/ui/navigation/nav.dart';

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
        image: AssetImage("fondo_home4.png"),
        fit: BoxFit.cover,
      ),
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 100.0,
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
        ],
      ),
    ),
  );
}

Widget campoUserName() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: TextField(
      controller: userName,
      maxLength: 10,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      decoration: const InputDecoration(
        hintText: "Username",
        fillColor: Color.fromARGB(99, 27, 38, 44),
        filled: true,
        hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ),
  );
}

Widget campoEmail() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: TextField(
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      controller: usuario,
      maxLength: 21,
      decoration: const InputDecoration(
        hintText: "Email",
        fillColor: Color.fromARGB(99, 27, 38, 44),
        filled: true,
        hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ),
  );
}

Widget campoPassword() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: TextField(
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      controller: password,
      obscureText: true,
      decoration: const InputDecoration(
        hintText: "Password",
        fillColor: Color.fromARGB(99, 27, 38, 44),
        filled: true,
        hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ),
  );
}

Widget botonRegistrar() {
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
                    builder: (context) => const NavScreen(),
                  ),
                );
                userName.clear();
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
            crearDataUsuario();
          },
          child: const Text(
            "Go",
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
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 4,
            shadowColor: Colors.white,
            primary: const Color.fromARGB(255, 255, 123, 0),
          ),
          onPressed: () {
            Navigator.pop(context);
            userName.clear();
            usuario.clear();
            password.clear();
          },
          child: const Text(
            "Back",
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        );
      });
}
