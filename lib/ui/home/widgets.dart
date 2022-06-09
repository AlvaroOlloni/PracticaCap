import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mi_app/api_rest/giphy_api.dart';
import 'package:mi_app/main.dart';
import 'package:mi_app/models/Gif.dart';

Widget cuerpo() {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(
            "https://i.pinimg.com/564x/e3/e5/b1/e3e5b121a4a6d008971cccbd3088ef01.jpg"),
        fit: BoxFit.cover,
      ),
    ),
    child: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            botonGifs(),
          ]),
    ),
  );
}

Widget botonGifs() {
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
                builder: (context) => GifScreen(),
              ),
            );
          },
          child: const Text(
            "Ver Top 10 Gifs",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        );
      });
}
