import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_screen/views/pages.dart';

import '../../../../Details/widgets/app_bar.dart';
import '../../constants/constants.dart';
import 'components/courses.dart';
import 'components/diff_styles.dart';


class YogaScreen extends StatefulWidget {
  @override
  _YogaScreenState createState() => _YogaScreenState();
}

class _YogaScreenState extends State<YogaScreen> {

  int selsctedIconIndex = 2;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      appBar: MainAppBar(appBar: AppBar(), sum: 'Yoga',),
      body: Column(
        children: [
          DiffStyles(),
          Courses(),
        ],
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
