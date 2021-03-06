import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mi_app/ui/gym/fuerza/brazo/checkSWBrazo.dart';
import 'package:mi_app/ui/gym/fuerza/brazo/mostrarBrazo.dart';
import 'package:mi_app/ui/gym/fuerza/espalda/checkSWEspalda.dart';
import 'package:mi_app/ui/gym/fuerza/pecho/checkSWPecho.dart';
import 'package:mi_app/ui/gym/fuerza/espalda/mostrarEspalda.dart';
import 'package:mi_app/ui/gym/fuerza/pecho/mostrarPecho.dart';
import 'package:mi_app/ui/gym/fuerza/pierna/checkSWPierna.dart';
import 'package:mi_app/ui/gym/fuerza/pierna/mostrarPierna.dart';

class FuerzaScreen extends StatefulWidget {
  const FuerzaScreen({Key? key}) : super(key: key);

  @override
  State<FuerzaScreen> createState() => _FuerzaScreenState();
}

class _FuerzaScreenState extends State<FuerzaScreen> {
  //Variables primer ListView
  bool benchPressSwitched = false;
  bool pushUpsSwitched = false;
  bool dumbellSwitched = false;
  bool inclineSwitched = false;
  bool declineSwitched = false;
  bool dipsSwitched = false;
  bool cableSwitched = false;
  //Variables segundo ListView
  bool seatedSwitched = false;
  bool pullSwitched = false;
  bool singleArmSwitched = false;
  bool pullUpsSwitched = false;
  bool pullOverSwitched = false;
  bool deadLiftSwitched = false;
  bool pullOversSwitched = false;
  //Variables tercer ListView
  bool barbellSwitched = false;
  bool preacherSwitched = false;
  bool cableBicepsSwitched = false;
  bool cableTricepsSwitched = false;
  bool tricepsDipsSwitched = false;
  bool overheadSwitched = false;
  bool closeGripSwitched = false;
  //Variables cuarto ListView
  bool deadLift2Switched = false;
  bool legPressSwitched = false;
  bool hamstringSwitched = false;
  bool legExtensionSwitched = false;
  bool lungeSwitched = false;
  bool squatsSwitched = false;
  bool singleLegSwitched = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              'Strength',
              style: GoogleFonts.blackHanSans(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            elevation: 0,
            /* give the app bar rounded corners
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            */
          ),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("fondo_home6.png"), fit: BoxFit.cover),
            ),
            child: Column(
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
                    backgroundColor: const Color.fromARGB(0, 255, 255, 255),
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
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            Flexible(
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
                                            print(pushUpsSwitched);
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: 120,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Color.fromARGB(255, 0, 0, 0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    onPressed: () {
                                      checkDialog1(
                                          context,
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
                                        fontSize: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  width: 100,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Color.fromARGB(255, 0, 0, 0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const MostrarPechoScreen(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Go",
                                      style: GoogleFonts.blackHanSans(
                                        fontSize: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      // second tab bar view widget
                      Container(
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            Flexible(
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
                                        value: seatedSwitched,
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              seatedSwitched = value;
                                              print(seatedSwitched);
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
                                        value: pullSwitched,
                                        onChanged: (value) {
                                          setState(() {
                                            pullSwitched = value;
                                            print(pullSwitched);
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
                                        value: singleArmSwitched,
                                        onChanged: (value) {
                                          setState(() {
                                            singleArmSwitched = value;
                                            print(singleArmSwitched);
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
                                        value: pullUpsSwitched,
                                        onChanged: (value) {
                                          setState(() {
                                            pullUpsSwitched = value;
                                            print(pullUpsSwitched);
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
                                        value: pullOverSwitched,
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              pullOverSwitched = value;
                                              print(pullOverSwitched);
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
                                        value: deadLiftSwitched,
                                        onChanged: (value) {
                                          setState(() {
                                            deadLiftSwitched = value;
                                            print(deadLiftSwitched);
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
                                        value: pullOversSwitched,
                                        onChanged: (value) {
                                          setState(() {
                                            pullOversSwitched = value;
                                            print(pullOversSwitched);
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: 150,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Color.fromARGB(255, 0, 0, 0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    onPressed: () {
                                      checkDialog2(
                                          context,
                                          seatedSwitched,
                                          pullSwitched,
                                          singleArmSwitched,
                                          pullUpsSwitched,
                                          pullOverSwitched,
                                          deadLiftSwitched,
                                          pullOversSwitched);
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
                                SizedBox(
                                  height: 50,
                                  width: 150,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const MostrarEspaldaScreen(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Go",
                                      style: GoogleFonts.blackHanSans(
                                        fontSize: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      // third tab bar view widget
                      Container(
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            Flexible(
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
                                        value: barbellSwitched,
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              barbellSwitched = value;
                                              print(barbellSwitched);
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
                                        value: preacherSwitched,
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              preacherSwitched = value;
                                              print(preacherSwitched);
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
                                        value: cableBicepsSwitched,
                                        onChanged: (value) {
                                          setState(() {
                                            cableBicepsSwitched = value;
                                            print(cableBicepsSwitched);
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
                                        value: cableTricepsSwitched,
                                        onChanged: (value) {
                                          setState(() {
                                            cableTricepsSwitched = value;
                                            print(cableTricepsSwitched);
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
                                        value: tricepsDipsSwitched,
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              tricepsDipsSwitched = value;
                                              print(tricepsDipsSwitched);
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
                                        value: overheadSwitched,
                                        onChanged: (value) {
                                          setState(() {
                                            overheadSwitched = value;
                                            print(overheadSwitched);
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
                                        value: closeGripSwitched,
                                        onChanged: (value) {
                                          setState(() {
                                            closeGripSwitched = value;
                                            print(closeGripSwitched);
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: 150,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Color.fromARGB(255, 0, 0, 0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    onPressed: () {
                                      checkDialog3(
                                          context,
                                          barbellSwitched,
                                          preacherSwitched,
                                          cableBicepsSwitched,
                                          cableTricepsSwitched,
                                          tricepsDipsSwitched,
                                          overheadSwitched,
                                          closeGripSwitched);
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
                                SizedBox(
                                  height: 50,
                                  width: 150,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Color.fromARGB(255, 0, 0, 0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const MostrarBrazoScreen(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Go",
                                      style: GoogleFonts.blackHanSans(
                                        fontSize: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Fourth tab bar view widge
                      Container(
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            Flexible(
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
                                        value: deadLift2Switched,
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              deadLift2Switched = value;
                                              print(deadLift2Switched);
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
                                        value: legPressSwitched,
                                        onChanged: (value) {
                                          setState(() {
                                            legPressSwitched = value;
                                            print(legPressSwitched);
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
                                        value: hamstringSwitched,
                                        onChanged: (value) {
                                          setState(() {
                                            hamstringSwitched = value;
                                            print(hamstringSwitched);
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
                                        value: legExtensionSwitched,
                                        onChanged: (value) {
                                          setState(() {
                                            legExtensionSwitched = value;
                                            print(legExtensionSwitched);
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
                                        value: lungeSwitched,
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              lungeSwitched = value;
                                              print(lungeSwitched);
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
                                        value: squatsSwitched,
                                        onChanged: (value) {
                                          setState(() {
                                            squatsSwitched = value;
                                            print(squatsSwitched);
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
                                        value: singleLegSwitched,
                                        onChanged: (value) {
                                          setState(() {
                                            singleLegSwitched = value;
                                            print(singleLegSwitched);
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: 150,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Color.fromARGB(255, 0, 0, 0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    onPressed: () {
                                      checkDialog4(
                                          context,
                                          deadLift2Switched,
                                          legPressSwitched,
                                          hamstringSwitched,
                                          legExtensionSwitched,
                                          lungeSwitched,
                                          squatsSwitched,
                                          singleLegSwitched);
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
                                SizedBox(
                                  height: 50,
                                  width: 150,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const MostrarPiernaScreen(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Go",
                                      style: GoogleFonts.blackHanSans(
                                        fontSize: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 230,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 0, 0, 0),
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
                            fontSize: 35,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Switched {
  bool Sw1 = false;
  bool Sw2 = false;
  bool Sw3 = false;
  bool Sw4 = false;
  bool Sw5 = false;
  bool Sw6 = false;
  bool Sw7 = false;
  Switched(
      this.Sw1, this.Sw2, this.Sw3, this.Sw4, this.Sw5, this.Sw6, this.Sw7);
}
