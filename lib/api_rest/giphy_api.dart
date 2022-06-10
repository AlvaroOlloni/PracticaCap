import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/Gif.dart';

class GifScreen extends StatefulWidget {
  const GifScreen({Key? key}) : super(key: key);

  @override
  State<GifScreen> createState() => _GifScreenState();
}

class _GifScreenState extends State<GifScreen> {
  late Future<List<Gif>> _listadoGifs;
  Future<List<Gif>> _getGifs() async {
    final response = await http.get(
      Uri.parse(
        "https://api.giphy.com/v1/gifs/trending?api_key=SV0pYjxuy7Mo5BM60Iggr3khPtY7xSzN&limit=10&rating=g",
      ),
    );

    List<Gif> gifs = [];
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);

      final jsonData = jsonDecode(body);

      for (var item in jsonData["data"]) {
        gifs.add(Gif(item["title"], item["images"]["downsized"]["url"]));
      }
    } else {
      throw Exception("Falló la conexión");
    }

    return gifs;
  }

  @override
  void initState() {
    super.initState();
    _listadoGifs = _getGifs();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Top de Gifs actuales'),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: FutureBuilder(
          future: _listadoGifs,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // ignore: avoid_print
              print(snapshot.data);
              return GridView.count(
                crossAxisCount: 2,
                children: _listGifs(snapshot.data as List<Gif>),
              );
            } else if (snapshot.hasError) {
              // ignore: avoid_print
              print(snapshot.error);
              return const Text("Hola2");
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  List<Widget> _listGifs(List<Gif> data) {
    List<Widget> gifs = [];

    for (var gif in data) {
      gifs.add(
        Card(
            child: Column(
          children: [
            Expanded(
              child: Image.network(
                gif.url,
                fit: BoxFit.fill,
              ),
            ),
          ],
        )),
      );
    }

    return gifs;
  }
}
