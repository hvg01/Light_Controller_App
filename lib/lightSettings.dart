import 'dart:ui';

import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  final Function update;
  SettingsPage(this.update);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

var screenHeight = window.physicalSize.height / window.devicePixelRatio;
var screenWidth = window.physicalSize.width / window.devicePixelRatio;

class _SettingsPageState extends State<SettingsPage> {
  Map initialData = {
    'mainPageHeight': screenHeight * 0.72,
    'sliderValue': 0.0,
    'colorPosition': 0.0,
    'scenePosition': 0.0,
    'selectLightRowPosition': 400.0,
    'lampPosition': 0.0,
    'noOfLightsPosition': 160.0
  };

  double sliderVal = 1.0;
  Color lampColor = Colors.amber.shade600;

  Future<Map> get animationData {
    return Future<Map>.value({
      'mainPageHeight': screenHeight * 0.54,
      'sliderValue': 1.0,
      'colorPosition': 30.0,
      'scenePosition': screenWidth * 0.32,
      'selectLightRowPosition': 30.0,
      'lampPosition': 40.0,
      'noOfLightsPosition': 180.0
    });
  }

  @override
  Widget build(BuildContext context) {
    print("here" + '${MediaQuery.of(context).size.width * 0.35}');
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: FutureBuilder<Map>(
          future: animationData,
          initialData: initialData,
          builder: (context, snapshot) {
            return Stack(
              children: [
                Positioned(
                  top: 100,
                  left: 30,
                  child: Text(
                    "Bed\nRoom",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right,
                  ),
                ),
                Positioned(
                    top: 90,
                    left: 10,
                    child: BackButton(
                      color: Colors.white,
                      onPressed: () {
                        widget.update(false);
                      },
                    )),
                AnimatedPositioned(
                    top: snapshot.data!['noOfLightsPosition'],
                    left: 30,
                    child: Text(
                      "4 Lights",
                      style: TextStyle(
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    duration: Duration(milliseconds: 400)),
                Positioned(
                  top: 0,
                  right: 50,
                  child: Column(
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 400),
                        width: 5,
                        height: snapshot.data!['lampPosition'],
                        color: Colors.white,
                      ),
                      Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            left: 55,
                            child: Stack(
                              children: [
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: (BoxDecoration(
                                      color: Colors.black26,
                                      shape: BoxShape.circle)),
                                ),
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: (BoxDecoration(
                                      color: lampColor,
                                      shape: BoxShape.circle)),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Image.asset('lib/assets/Group38.png'),
                              SizedBox(
                                height: 12.5,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 400),
                  top: 225,
                  left: snapshot.data!['selectLightRowPosition'],
                  child: Container(
                    height: 50,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          height: 75,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Image.asset('lib/assets/surface1.png'),
                              SizedBox(width: 10),
                              Text("Main Room")
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          height: 75,
                          decoration: BoxDecoration(
                              color: Colors.indigo[900],
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Image.asset(
                                  'lib/assets/furniture-and-household.png'),
                              SizedBox(width: 10),
                              Text("Desk Light",
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          height: 75,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Image.asset('lib/assets/bed2.png'),
                              SizedBox(width: 10),
                              Text("Bed Room")
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          AnimatedContainer(
                              height: snapshot.data!['mainPageHeight'],
                              duration: Duration(milliseconds: 200),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      topRight: Radius.circular(40))),
                              child: SingleChildScrollView(
                                child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "    Intensity",
                                            style: TextStyle(
                                                color: Colors.indigo[900],
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                  'lib/assets/solution2.png'),
                                              Column(
                                                children: [
                                                  Container(
                                                    width: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.75,
                                                    child: SliderTheme(
                                                      data: SliderTheme.of(
                                                              context)
                                                          .copyWith(
                                                              trackHeight: 0.5,
                                                              thumbColor:
                                                                  Colors.white,
                                                              activeTrackColor:
                                                                  Colors
                                                                      .amber[600],
                                                              inactiveTrackColor:
                                                                  Colors.grey,
                                                              thumbShape:
                                                                  RoundSliderThumbShape(
                                                                      enabledThumbRadius:
                                                                          7.5),
                                                              overlayColor: Colors
                                                                  .amber
                                                                  .withOpacity(
                                                                      0.3)),
                                                      child: Slider(
                                                          value: sliderVal,
                                                          onChanged: (val) {
                                                            setState(() {
                                                              sliderVal = val;
                                                              lampColor = lampColor
                                                                  .withOpacity(
                                                                      sliderVal);
                                                            });
                                                          }),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Image.asset(
                                                  'lib/assets/solution.png'),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "    Colors",
                                            style: TextStyle(
                                                color: Colors.indigo[900],
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            height: 25,
                                            child: Stack(
                                              children: [
                                                colorPicker(
                                                    position: 20.0,
                                                    color: Color(0XFFFF9B99)),
                                                colorPicker(
                                                    position: 30.0 +
                                                        snapshot.data![
                                                            'colorPosition'],
                                                    color: Color(0XFF96EB9D)),
                                                colorPicker(
                                                    position: 40.0 +
                                                        snapshot.data![
                                                                'colorPosition'] *
                                                            2,
                                                    color: Color(0XFF94CAEC)),
                                                colorPicker(
                                                    position: 50.0 +
                                                        snapshot.data![
                                                                'colorPosition'] *
                                                            3,
                                                    color: Color(0XFFA398DA)),
                                                colorPicker(
                                                    position: 60.0 +
                                                        snapshot.data![
                                                                'colorPosition'] *
                                                            4,
                                                    color: Color(0XFFDE94EB)),
                                                colorPicker(
                                                    position: 70.0 +
                                                        snapshot.data![
                                                                'colorPosition'] *
                                                            5,
                                                    color: Color(0XFFEAD093)),
                                                colorPicker(
                                                  position: 80.0 +
                                                      snapshot.data![
                                                              'colorPosition'] *
                                                          6,
                                                  icon: Icon(
                                                    Icons.add,
                                                    color: Colors.indigo.shade900,
                                                    size: 18,
                                                  ),
                                                  color: Colors.white,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            "    Scenes",
                                            style: TextStyle(
                                                color: Colors.indigo[900],
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            height: 65,
                                            child: Stack(
                                              children: [
                                                scenesCard(
                                                    position: 20.0,
                                                    color: Color(0XFFFF9B99),
                                                    text: 'Birthday'),
                                                scenesCard(
                                                    position: 75.0 +
                                                        snapshot.data![
                                                            'scenePosition'],
                                                    color: Color(0XFFDE94EB),
                                                    text: 'Party'),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            height: 65,
                                            child: Stack(
                                              children: [
                                                scenesCard(
                                                    position: 20.0,
                                                    color: Color(0XFF94CAEC),
                                                    text: 'Relax'),
                                                scenesCard(
                                                    position: 75.0 +
                                                        snapshot.data![
                                                            'scenePosition'],
                                                    color: Color(0XFF96EB9D),
                                                    text: 'Fun'),
                                              ],
                                            ),
                                          )
                                        ])),
                              )),
                        ],
                      ),
                      Positioned(
                        top: 0,
                        right: 50,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset('lib/assets/poweroff.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }

  Widget colorPicker(
      {double position = 0.0, Color color = Colors.white, var icon}) {
    return AnimatedPositioned(
        duration: Duration(milliseconds: 400),
        left: position,
        child: GestureDetector(
          onTap: () {
            setState(() {
              lampColor = color.withOpacity(sliderVal);
            });
          },
          child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(shape: BoxShape.circle, color: color),
              child: Container(
                child: icon,
              )),
        ));
  }

  Widget scenesCard(
      {double position = 0.0, Color color = Colors.white, String text = ''}) {
    return AnimatedPositioned(
        left: position,
        child: Container(
          height: 55,
          width: screenWidth * 0.35,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("lib/assets/surface2.png"),
              SizedBox(
                width: 10,
              ),
              Text(
                "$text",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        duration: Duration(milliseconds: 400));
  }
}
