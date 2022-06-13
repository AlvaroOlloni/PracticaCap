// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mi_app/ui/navigation/nav.dart';

class FuerzaScreen extends StatefulWidget {
  @override
  State<FuerzaScreen> createState() => _FuerzaScreenState();
}

class _FuerzaScreenState extends State<FuerzaScreen> {
  bool benchPressSwitched = false;
  bool pushUpsSwitched = false;
  bool dumbellSwitched = false;
  bool inclineSwitched = false;
  bool declineSwitched = false;
  bool dipsSwitched = false;
  bool cableSwitched = false;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Strength',
            style: GoogleFonts.blackHanSans(
                fontSize: 24, color: Color.fromARGB(255, 255, 255, 255)),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 255, 0, 0),
          elevation: 0,
          // give the app bar rounded corners
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            // construct the profile details widget here
            Container(
              height: 245,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("fuerza.jpg"),
                ),
              ),
            ),

            // the tab bar with two items
            SizedBox(
              height: 50,
              child: AppBar(
                backgroundColor: Colors.black,
                bottom: const TabBar(
                  tabs: [
                    Tab(
                      icon: ImageIcon(
                        AssetImage("bench_press.png"),
                        size: 40,
                      ),
                    ),
                    Tab(
                      icon: ImageIcon(
                        AssetImage("human_back.png"),
                        size: 40,
                      ),
                    ),
                    Tab(
                      icon: ImageIcon(
                        AssetImage("arm.png"),
                        size: 40,
                      ),
                    ),
                    Tab(
                      icon: ImageIcon(
                        AssetImage("legs.png"),
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // create widgets for each tab bar here
            Expanded(
              child: TabBarView(
                children: [
                  // first tab bar view widget
                  Container(
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Bench Press"),
                            Switch(
                              value: benchPressSwitched,
                              onChanged: (value) {
                                setState(() {
                                  benchPressSwitched = value;
                                  print(benchPressSwitched);
                                });
                              },
                              activeTrackColor: Color.fromARGB(255, 0, 17, 255),
                              activeColor: Colors.black,
                              inactiveThumbColor: Colors.black,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Push Ups"),
                            Switch(
                              value: pushUpsSwitched,
                              onChanged: (value) {
                                setState(() {
                                  pushUpsSwitched = value;
                                  print(benchPressSwitched);
                                });
                              },
                              activeTrackColor: Color.fromARGB(255, 0, 17, 255),
                              activeColor: Colors.black,
                              inactiveThumbColor: Colors.black,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("DUMBBELL FLYES"),
                            Switch(
                              value: dumbellSwitched,
                              onChanged: (value) {
                                setState(() {
                                  dumbellSwitched = value;
                                  print(dumbellSwitched);
                                });
                              },
                              activeTrackColor: Color.fromARGB(255, 0, 17, 255),
                              activeColor: Colors.black,
                              inactiveThumbColor: Colors.black,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Incline Bench Press"),
                            Switch(
                              value: inclineSwitched,
                              onChanged: (value) {
                                setState(() {
                                  inclineSwitched = value;
                                  print(inclineSwitched);
                                });
                              },
                              activeTrackColor: Color.fromARGB(255, 0, 17, 255),
                              activeColor: Colors.black,
                              inactiveThumbColor: Colors.black,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Decline Bench Press"),
                            Switch(
                              value: declineSwitched,
                              onChanged: (value) {
                                setState(() {
                                  declineSwitched = value;
                                  print(declineSwitched);
                                });
                              },
                              activeTrackColor: Color.fromARGB(255, 0, 17, 255),
                              activeColor: Colors.black,
                              inactiveThumbColor: Colors.black,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Dips"),
                            Switch(
                              value: dipsSwitched,
                              onChanged: (value) {
                                setState(() {
                                  dipsSwitched = value;
                                  print(dipsSwitched);
                                });
                              },
                              activeTrackColor: Color.fromARGB(255, 0, 17, 255),
                              activeColor: Colors.black,
                              inactiveThumbColor: Colors.black,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Cable chest"),
                            Switch(
                              value: cableSwitched,
                              onChanged: (value) {
                                setState(() {
                                  cableSwitched = value;
                                  print(cableSwitched);
                                });
                              },
                              activeTrackColor: Color.fromARGB(255, 0, 17, 255),
                              activeColor: Colors.black,
                              inactiveThumbColor: Colors.black,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),

                  // second tab bar viiew widget
                  Container(
                    color: Color.fromARGB(255, 226, 113, 150),
                    child: const Center(
                      child: Text(
                        'Back',
                      ),
                    ),
                  ),
                  // third tab bar view widget
                  Container(
                    color: Color.fromARGB(255, 15, 155, 101),
                    child: const Center(
                      child: Text(
                        'Arms',
                      ),
                    ),
                  ),
                  Container(
                    color: Color.fromARGB(255, 218, 214, 17),
                    child: const Center(
                      child: Text(
                        'Legs',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
                  width: 410,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Go Back")),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
