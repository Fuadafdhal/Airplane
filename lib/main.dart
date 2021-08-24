import 'package:airplan/ui/pages/bonus_page.dart';
import 'package:airplan/ui/pages/get_started_page.dart';
import 'package:airplan/ui/pages/home_page.dart';
import 'package:airplan/ui/pages/main_page.dart';
import 'package:airplan/ui/pages/sign_up_page.dart';
import 'package:airplan/ui/pages/splash_page.dart.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/get-started': (context) => GetStartedPage(),
        '/sign-up': (context) => SignUpPage(),
        '/bonus': (context) => BonusPage(),
        '/main': (context) => MainPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
