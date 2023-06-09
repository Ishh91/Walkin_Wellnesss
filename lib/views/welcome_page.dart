import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_screen/Details/detail.dart';
import 'package:onboarding_screen/views/yoga/screens/home/home_screen.dart';
import '../details_page.dart';
import 'pages.dart';
import '../widgets/workout/round_info_container.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Walkin_Wellness'),
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
                  Icons.food_bank_outlined,
                ),
                title: const Text('Activity'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DetailsPage()));
                },
              ), ListTile(
                leading: Icon(
                  Icons.food_bank_outlined,
                ),
                title: const Text('Meditation'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DetailsScreen()));
                },
              ),ListTile(
                leading: Icon(
                  Icons.food_bank_outlined,
                ),
                title: const Text('Yoga'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => YogaScreen()));
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
              ),

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
            Positioned(bottom: 0, left: 0, right: 0, child: BottomNavigation()),
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
