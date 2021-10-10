import 'package:flutter/material.dart';
import 'package:light_controller/lightSettings.dart';
import 'package:light_controller/widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool button = false;

  _updateButton(bool val){
    setState(() {
      button=val;
    });

  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: !button?
      Stack(
        children: [
         
          Positioned(
            top: 80,
            left: 40,
            child: Text(
              "Control\nPanel",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 70,
            right: 30,
            child: Image.asset('lib/assets/user.png'),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 580,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "    All Rooms",
                        style: TextStyle(
                            color: Colors.indigo[900],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  _updateButton(true);
                                },
                                child: LightLocationCard(
                                  imageUrl: 'lib/assets/bed.png',
                                  location: 'Bed room',
                                  numberOfLights: 4,
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  
                                },
                                child: LightLocationCard(
                                  imageUrl: 'lib/assets/room.png',
                                  location: 'Living room',
                                  numberOfLights: 2,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: (){

                                },
                                child: LightLocationCard(
                                  imageUrl: 'lib/assets/kitchen.png',
                                  location: 'Kitchen',
                                  numberOfLights: 5,
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  

                                },
                                child: LightLocationCard(
                                  imageUrl: 'lib/assets/bathtube.png',
                                  location: 'Bathroom',
                                  numberOfLights: 1,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: (){

                                },
                                child: LightLocationCard(
                                  imageUrl: 'lib/assets/house.png',
                                  location: 'Outdoor',
                                  numberOfLights: 5,
                                ),
                              ),
                              GestureDetector(
                                onTap: (){

                                },
                                child: LightLocationCard(
                                  imageUrl: 'lib/assets/balcony.png',
                                  location: 'Balcony',
                                  numberOfLights: 2,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],)      
      :SettingsPage(_updateButton),
      bottomNavigationBar: BottomAppBar(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Image.asset('lib/assets/bulb.png'),
              onPressed: () {},
            ),
            SizedBox(
              width: 35,
            ),
            IconButton(
              icon: Image.asset('lib/assets/IconFeather-home.png'),
              onPressed: () {},
              
            ),
            SizedBox(
              width: 35,
            ),
            IconButton(
              icon: Image.asset('lib/assets/IconFeather-settings.png'),
              onPressed: () {},
            ),
          ],
        ),
      )),
    );
  }
}
