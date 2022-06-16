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
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Strength',
            style: GoogleFonts.blackHanSans(
              fontSize: 40,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
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
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("fuerza.jpg"),
                ),
                borderRadius: BorderRadius.circular(300.0),
              ),
            ),

            // the tab bar with four items
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
                    color: Color.fromARGB(255, 0, 0, 0),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Bench Press",
                              style: GoogleFonts.blackHanSans(
                                  fontSize: 20, color: Colors.white),
                            ),
                            Switch(
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.grey,
                              activeColor: Colors.deepOrange,
                              inactiveThumbColor: Colors.white,
                              value: benchPressSwitched,
                              onChanged: (value) {
                                setState(
                                  () {
                                    benchPressSwitched = value;
                                    print(benchPressSwitched);
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Push Ups",
                              style: GoogleFonts.blackHanSans(
                                  fontSize: 20, color: Colors.white),
                            ),
                            Switch(
                              value: pushUpsSwitched,
                              onChanged: (value) {
                                setState(() {
                                  pushUpsSwitched = value;
                                  print(benchPressSwitched);
                                });
                              },
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.grey,
                              activeColor: Colors.deepOrange,
                              inactiveThumbColor: Colors.white,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "DUMBBELL FLYES",
                              style: GoogleFonts.blackHanSans(
                                  fontSize: 20, color: Colors.white),
                            ),
                            Switch(
                              value: dumbellSwitched,
                              onChanged: (value) {
                                setState(() {
                                  dumbellSwitched = value;
                                  print(dumbellSwitched);
                                });
                              },
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.grey,
                              activeColor: Colors.deepOrange,
                              inactiveThumbColor: Colors.white,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Incline Bench Press",
                              style: GoogleFonts.blackHanSans(
                                  fontSize: 20, color: Colors.white),
                            ),
                            Switch(
                              value: inclineSwitched,
                              onChanged: (value) {
                                setState(() {
                                  inclineSwitched = value;
                                  print(inclineSwitched);
                                });
                              },
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.grey,
                              activeColor: Colors.deepOrange,
                              inactiveThumbColor: Colors.white,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Decline Bench Press",
                              style: GoogleFonts.blackHanSans(
                                  fontSize: 20, color: Colors.white),
                            ),
                            Switch(
                              value: declineSwitched,
                              onChanged: (value) {
                                setState(
                                  () {
                                    declineSwitched = value;
                                    print(declineSwitched);
                                  },
                                );
                              },
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.grey,
                              activeColor: Colors.deepOrange,
                              inactiveThumbColor: Colors.white,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Dips",
                              style: GoogleFonts.blackHanSans(
                                  fontSize: 20, color: Colors.white),
                            ),
                            Switch(
                              value: dipsSwitched,
                              onChanged: (value) {
                                setState(() {
                                  dipsSwitched = value;
                                  print(dipsSwitched);
                                });
                              },
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.grey,
                              activeColor: Colors.deepOrange,
                              inactiveThumbColor: Colors.white,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Cable chest",
                              style: GoogleFonts.blackHanSans(
                                  fontSize: 20, color: Colors.white),
                            ),
                            Switch(
                              value: cableSwitched,
                              onChanged: (value) {
                                setState(() {
                                  cableSwitched = value;
                                  print(cableSwitched);
                                });
                              },
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.grey,
                              activeColor: Colors.deepOrange,
                              inactiveThumbColor: Colors.white,
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
                    color: Color.fromARGB(255, 0, 0, 0),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Seated Row",
                              style: GoogleFonts.blackHanSans(
                                  fontSize: 20, color: Colors.white),
                            ),
                            Switch(
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.grey,
                              activeColor: Colors.deepOrange,
                              inactiveThumbColor: Colors.white,
                              value: benchPressSwitched,
                              onChanged: (value) {
                                setState(
                                  () {
                                    benchPressSwitched = value;
                                    print(benchPressSwitched);
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Pull-Down",
                              style: GoogleFonts.blackHanSans(
                                  fontSize: 20, color: Colors.white),
                            ),
                            Switch(
                              value: pushUpsSwitched,
                              onChanged: (value) {
                                setState(() {
                                  pushUpsSwitched = value;
                                  print(benchPressSwitched);
                                });
                              },
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.grey,
                              activeColor: Colors.deepOrange,
                              inactiveThumbColor: Colors.white,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Single-Arm Dumbbell Row",
                              style: GoogleFonts.blackHanSans(
                                  fontSize: 20, color: Colors.white),
                            ),
                            Switch(
                              value: dumbellSwitched,
                              onChanged: (value) {
                                setState(() {
                                  dumbellSwitched = value;
                                  print(dumbellSwitched);
                                });
                              },
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.grey,
                              activeColor: Colors.deepOrange,
                              inactiveThumbColor: Colors.white,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Pull ups",
                              style: GoogleFonts.blackHanSans(
                                  fontSize: 20, color: Colors.white),
                            ),
                            Switch(
                              value: inclineSwitched,
                              onChanged: (value) {
                                setState(() {
                                  inclineSwitched = value;
                                  print(inclineSwitched);
                                });
                              },
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.grey,
                              activeColor: Colors.deepOrange,
                              inactiveThumbColor: Colors.white,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Dumbell pull over",
                              style: GoogleFonts.blackHanSans(
                                  fontSize: 20, color: Colors.white),
                            ),
                            Switch(
                              value: declineSwitched,
                              onChanged: (value) {
                                setState(
                                  () {
                                    declineSwitched = value;
                                    print(declineSwitched);
                                  },
                                );
                              },
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.grey,
                              activeColor: Colors.deepOrange,
                              inactiveThumbColor: Colors.white,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Dead lift",
                              style: GoogleFonts.blackHanSans(
                                  fontSize: 20, color: Colors.white),
                            ),
                            Switch(
                              value: dipsSwitched,
                              onChanged: (value) {
                                setState(() {
                                  dipsSwitched = value;
                                  print(dipsSwitched);
                                });
                              },
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.grey,
                              activeColor: Colors.deepOrange,
                              inactiveThumbColor: Colors.white,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Pullovers",
                              style: GoogleFonts.blackHanSans(
                                  fontSize: 20, color: Colors.white),
                            ),
                            Switch(
                              value: cableSwitched,
                              onChanged: (value) {
                                setState(() {
                                  cableSwitched = value;
                                  print(cableSwitched);
                                });
                              },
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.grey,
                              activeColor: Colors.deepOrange,
                              inactiveThumbColor: Colors.white,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                  // third tab bar view widget
                  Container(
                    color: Color.fromARGB(255, 0, 0, 0),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Barbell biceps curl",
                              style: GoogleFonts.blackHanSans(
                                  fontSize: 20, color: Colors.white),
                            ),
                            Switch(
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.grey,
                              activeColor: Colors.deepOrange,
                              inactiveThumbColor: Colors.white,
                              value: benchPressSwitched,
                              onChanged: (value) {
                                setState(
                                  () {
                                    benchPressSwitched = value;
                                    print(benchPressSwitched);
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Preacher biceps curl",
                              style: GoogleFonts.blackHanSans(
                                  fontSize: 20, color: Colors.white),
                            ),
                            Switch(
                              value: pushUpsSwitched,
                              onChanged: (value) {
                                setState(
                                  () {
                                    pushUpsSwitched = value;
                                    print(benchPressSwitched);
                                  },
                                );
                              },
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.grey,
                              activeColor: Colors.deepOrange,
                              inactiveThumbColor: Colors.white,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Cable biceps curl",
                              style: GoogleFonts.blackHanSans(
                                  fontSize: 20, color: Colors.white),
                            ),
                            Switch(
                              value: dumbellSwitched,
                              onChanged: (value) {
                                setState(() {
                                  dumbellSwitched = value;
                                  print(dumbellSwitched);
                                });
                              },
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.grey,
                              activeColor: Colors.deepOrange,
                              inactiveThumbColor: Colors.white,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Cable triceps pushdown",
                              style: GoogleFonts.blackHanSans(
                                  fontSize: 20, color: Colors.white),
                            ),
                            Switch(
                              value: inclineSwitched,
                              onChanged: (value) {
                                setState(() {
                                  inclineSwitched = value;
                                  print(inclineSwitched);
                                });
                              },
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.grey,
                              activeColor: Colors.deepOrange,
                              inactiveThumbColor: Colors.white,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Dips",
                              style: GoogleFonts.blackHanSans(
                                  fontSize: 20, color: Colors.white),
                            ),
                            Switch(
                              value: declineSwitched,
                              onChanged: (value) {
                                setState(
                                  () {
                                    declineSwitched = value;
                                    print(declineSwitched);
                                  },
                                );
                              },
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.grey,
                              activeColor: Colors.deepOrange,
                              inactiveThumbColor: Colors.white,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Overhead Triceps Extensions",
                              style: GoogleFonts.blackHanSans(
                                  fontSize: 20, color: Colors.white),
                            ),
                            Switch(
                              value: dipsSwitched,
                              onChanged: (value) {
                                setState(() {
                                  dipsSwitched = value;
                                  print(dipsSwitched);
                                });
                              },
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.grey,
                              activeColor: Colors.deepOrange,
                              inactiveThumbColor: Colors.white,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Close Grip Bench Presses",
                              style: GoogleFonts.blackHanSans(
                                  fontSize: 20, color: Colors.white),
                            ),
                            Switch(
                              value: cableSwitched,
                              onChanged: (value) {
                                setState(() {
                                  cableSwitched = value;
                                  print(cableSwitched);
                                });
                              },
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.grey,
                              activeColor: Colors.deepOrange,
                              inactiveThumbColor: Colors.white,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Color.fromARGB(255, 0, 0, 0),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Deadlift",
                              style: GoogleFonts.blackHanSans(
                                  fontSize: 20, color: Colors.white),
                            ),
                            Switch(
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.grey,
                              activeColor: Colors.deepOrange,
                              inactiveThumbColor: Colors.white,
                              value: benchPressSwitched,
                              onChanged: (value) {
                                setState(
                                  () {
                                    benchPressSwitched = value;
                                    print(benchPressSwitched);
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Leg press",
                              style: GoogleFonts.blackHanSans(
                                  fontSize: 20, color: Colors.white),
                            ),
                            Switch(
                              value: pushUpsSwitched,
                              onChanged: (value) {
                                setState(() {
                                  pushUpsSwitched = value;
                                  print(benchPressSwitched);
                                });
                              },
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.grey,
                              activeColor: Colors.deepOrange,
                              inactiveThumbColor: Colors.white,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Seated hamstring curl",
                              style: GoogleFonts.blackHanSans(
                                  fontSize: 20, color: Colors.white),
                            ),
                            Switch(
                              value: dumbellSwitched,
                              onChanged: (value) {
                                setState(() {
                                  dumbellSwitched = value;
                                  print(dumbellSwitched);
                                });
                              },
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.grey,
                              activeColor: Colors.deepOrange,
                              inactiveThumbColor: Colors.white,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Seated leg extension",
                              style: GoogleFonts.blackHanSans(
                                  fontSize: 20, color: Colors.white),
                            ),
                            Switch(
                              value: inclineSwitched,
                              onChanged: (value) {
                                setState(() {
                                  inclineSwitched = value;
                                  print(inclineSwitched);
                                });
                              },
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.grey,
                              activeColor: Colors.deepOrange,
                              inactiveThumbColor: Colors.white,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Dumbbell lunge",
                              style: GoogleFonts.blackHanSans(
                                  fontSize: 20, color: Colors.white),
                            ),
                            Switch(
                              value: declineSwitched,
                              onChanged: (value) {
                                setState(
                                  () {
                                    declineSwitched = value;
                                    print(declineSwitched);
                                  },
                                );
                              },
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.grey,
                              activeColor: Colors.deepOrange,
                              inactiveThumbColor: Colors.white,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Squats",
                              style: GoogleFonts.blackHanSans(
                                  fontSize: 20, color: Colors.white),
                            ),
                            Switch(
                              value: dipsSwitched,
                              onChanged: (value) {
                                setState(() {
                                  dipsSwitched = value;
                                  print(dipsSwitched);
                                });
                              },
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.grey,
                              activeColor: Colors.deepOrange,
                              inactiveThumbColor: Colors.white,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Single Leg Curl",
                              style: GoogleFonts.blackHanSans(
                                  fontSize: 20, color: Colors.white),
                            ),
                            Switch(
                              value: cableSwitched,
                              onChanged: (value) {
                                setState(() {
                                  cableSwitched = value;
                                  print(cableSwitched);
                                });
                              },
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.grey,
                              activeColor: Colors.deepOrange,
                              inactiveThumbColor: Colors.white,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 4, 0, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      //Navigator.pop(context);
                      Switched sw = Switched(
                          benchPressSwitched,
                          pushUpsSwitched,
                          dumbellSwitched,
                          inclineSwitched,
                          declineSwitched,
                          dipsSwitched,
                          cableSwitched);
                    },
                    child: Text(
                      "Save",
                      style: GoogleFonts.blackHanSans(
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: 410,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 4, 0, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Go Back",
                      style: GoogleFonts.blackHanSans(
                        fontSize: 40,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Switched {
  bool benchSw = false;
  bool pushSw = false;
  bool dumbellSw = false;
  bool inclineSw = false;
  bool declineSw = false;
  bool dipsSw = false;
  bool cableSw = false;
  Switched(this.benchSw, this.pushSw, this.dumbellSw, this.inclineSw,
      this.declineSw, this.dipsSw, this.cableSw);
}
