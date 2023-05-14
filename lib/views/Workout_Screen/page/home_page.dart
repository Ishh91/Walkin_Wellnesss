import '../../../Details/widgets/app_bar.dart';
import '../../pages/bottom_menu.dart';
import 'workout_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    bottomNavigationBar: BottomNavigation(),
    appBar: MainAppBar(appBar: AppBar(), sum: 'Workout',),
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            ExercisesWidget(),

          ],

        ),
      );

  SliverAppBar buildAppBar(BuildContext context) => SliverAppBar(
        stretch: true,
        title: Text('Workout'),
        centerTitle: true,
        pinned: true,
        leading: GestureDetector(onTap: () {
          Navigator.pop(context);
        },
         child: Icon(Icons.arrow_back)),
        actions: [
          Icon(Icons.person, size: 28),
          SizedBox(width: 12),
        ],
      );
}
