import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_screen/views/Calculator/input_page.dart';
import 'package:onboarding_screen/views/authentication/login_page.dart';
import 'package:onboarding_screen/views/diet_page.dart';
import 'package:onboarding_screen/views/workout_page.dart';
import '../widgets/workout/round_info_container.dart';
import 'Calculator/results_page.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: null,
              ),
              ListTile(
                leading: Icon(
                  Icons.food_bank_outlined,
                ),
                title: const Text('Diet Plans'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.calculate_outlined,
                ),
                title: const Text('BMI Calculator'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => InputPage()));
                },
              ), ListTile(
                leading: Icon(
                  Icons.calculate_outlined,
                ),
                title: const Text('Workout'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => InputPage()));
                },
              ),
              ListTile(
                  leading: Icon(
                    Icons.logout_outlined,
                  ),
                  title: const Text('Logout'),
                  onTap: () {
                    FirebaseAuth.instance.signOut().then((value) {
                      print("Signed Out");
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    });
                  }),
            ],
          ),
        ),
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
              left: 430,
              right: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
        ));
  }

  Widget _divider() {
    return Container(
      width: 1.2,
      height: 35,
      color: Colors.white.withOpacity(0.4),
    );
  }
}
