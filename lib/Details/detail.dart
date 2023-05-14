import 'package:flutter/material.dart';
import 'package:onboarding_screen/Details/widgets/app_bar.dart';
import 'package:onboarding_screen/Details/widgets/dates.dart';
import 'package:onboarding_screen/Details/widgets/graph.dart';
import 'package:onboarding_screen/Details/widgets/info.dart' hide Stats;
import 'package:onboarding_screen/Details/widgets/stats.dart';
import 'package:onboarding_screen/Details/widgets/steps.dart';
import '../views/pages/bottom_menu.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MainAppBar(
        appBar: AppBar(),
        sum: 'Activity',
      ),
      bottomNavigationBar: BottomNavigation(),
      body: Column(
        children: const [
          Dates(),
          SizedBox(
            height: 20,
          ),
          Steps(),
          Graph(),
          Info(),
          Divider(height: 30),
          Stat(),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
