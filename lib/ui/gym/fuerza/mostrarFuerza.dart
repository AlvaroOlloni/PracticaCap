import 'package:flutter/material.dart';

class MostrarFuerzaScreen extends StatelessWidget {
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
  bool bicepsCurlSwitched = false;
  bool cableTricepsSwitched = false;
  bool tricepsDipsSwitched = false;
  bool overHeadSwitched = false;
  bool closeGripSwitched = false;
  //Variables cuarto ListView
  bool deadLift2Switched = false;
  bool legPressSwitched = false;
  bool hamstringSwitched = false;
  bool legExtensionSwitched = false;
  bool lungeSwitched = false;
  bool squatsSwitched = false;
  bool singleLegSwitched = false;
  MostrarFuerzaScreen(
      this.benchPressSwitched,
      this.pushUpsSwitched,
      this.dumbellSwitched,
      this.inclineSwitched,
      this.declineSwitched,
      this.dipsSwitched,
      this.cableSwitched,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$benchPressSwitched $pushUpsSwitched $dumbellSwitched $inclineSwitched $declineSwitched $dipsSwitched $cableSwitched",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
//Text("$benchPressSwitched $pushUpsSwitched $dumbellSwitched $inclineSwitched $declineSwitched $dipsSwitched $cableSwitched")