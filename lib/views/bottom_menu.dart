import 'package:flutter/material.dart';
import 'package:onboarding_screen/views/authentication/logout_page.dart';
import 'package:onboarding_screen/views/welcome_page.dart';
import 'diet_page.dart';
class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      color: const Color(0xfff8f8f8),
      child: IconTheme(
        data: const IconThemeData(color: Color(0xffabadb4)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
              child: const Icon(
                Icons.add_chart,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.home),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LogOutPage()));
              },
              child: const Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}
