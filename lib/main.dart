import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_screen/app_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './views/pages.dart';

bool? seenOnboard;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  SharedPreferences pref = await SharedPreferences.getInstance();
  seenOnboard = pref.getBool('seenOnboard') ?? false; //if null set to false
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Walk_in Wellness',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.manropeTextTheme(
          Theme.of(context).textTheme,
        ), // textTheme: GoogleFonts,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: kScaffoldBackground,
      ),
      home: seenOnboard == true ? SignUpPage() : OnBoardingPage(),
    );
  }
}
// this is dart file
