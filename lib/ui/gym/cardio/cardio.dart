import 'package:flutter/material.dart';

class CardioScreen extends StatelessWidget {
  const CardioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cardio'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text('CardioScreen'),
        ),
      ),
    );
  }
}
