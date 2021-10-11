import 'package:flutter/material.dart';

class LightLocationCard extends StatelessWidget {
  final String imageUrl;
  final String location;
  final int numberOfLights;

  LightLocationCard(
      {required this.location,
      required this.imageUrl,
      required this.numberOfLights});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.38,
      width: MediaQuery.of(context).size.width * 0.38,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              offset: Offset(0.0, 3.0),
              blurRadius: 8.0,
            )
          ]),
      child: Container(
        margin: EdgeInsets.only(top: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('$imageUrl'),
            SizedBox(
              height: 22,
            ),
            Text(
              "$location",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              "$numberOfLights lights",
              style: TextStyle(
                color: Colors.amber[600],
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
