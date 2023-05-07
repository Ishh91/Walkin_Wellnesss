import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:onboarding_screen/views/workout_page.dart';
import '../widgets/workout/round_info_container.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/details.png'),
                    fit: BoxFit.cover,
                    alignment: Alignment.centerLeft)),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 1,
                sigmaY: 2,
              ),
              child: Container(
                color: Colors.white.withOpacity(.123),
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 10,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.menu),
                  iconSize: 30,
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite),
                  iconSize: 30,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 22.0),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.6),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    'NEW',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.0),
                  child: Text(
                    ' FULL-BODY KILLER \nWORKOUT',
                    style: TextStyle(color: Colors.white, fontSize: 28.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RoundInfoContainer(title: '26', subtitle: 'Minutes'),
                    _divider(),
                    RoundInfoContainer(title: '3', subtitle: 'Rounds'),
                    _divider(),
                    RoundInfoContainer(title: 'EASY', subtitle: 'Level'),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 10,
            right: 10,
            child: GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => WorkoutScreen(),
              )),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Row(
                  children: [
                    Text(
                      'Start Workout',
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: 20,
                      color: Colors.black,
                    )
                  ],
                ),
              ),

            ),
          )
        ],
      ),
    );
  }

  Widget _divider() {
    return Container(
      width: 1.2,
      height: 35,
      color: Colors.white.withOpacity(0.4),
    );
  }
}
