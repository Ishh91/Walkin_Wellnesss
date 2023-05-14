import 'package:flutter/material.dart';
import 'package:onboarding_screen/Details/detail.dart';
import 'package:onboarding_screen/views/Workout_Screen/page/home_page.dart';
import '../../details_page.dart';
import '../pages.dart';
class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      color: Colors.transparent,
      child: IconTheme(
        data: const IconThemeData(color: Color(0xffabadb4)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailsPage()));
              },
              child: const Icon(
                Icons.add_chart,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailsScreen()));
              },
              child: const Icon(Icons.sports_gymnastics_outlined),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> WelcomePage()));
              },
              child: const Icon(Icons.home),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: const Icon(Icons.fitness_center_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
