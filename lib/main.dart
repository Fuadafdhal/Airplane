import 'package:airplan/cubit/auth_cubit.dart';
import 'package:airplan/cubit/destination_cubit.dart';
import 'package:airplan/cubit/page_cubit.dart';
import 'package:airplan/cubit/seat_cubit.dart';
import 'package:airplan/ui/pages/bonus_page.dart';
import 'package:airplan/ui/pages/get_started_page.dart';
import 'package:airplan/ui/pages/home_page.dart';
import 'package:airplan/ui/pages/main_page.dart';
import 'package:airplan/ui/pages/sign_in_page.dart';
import 'package:airplan/ui/pages/sign_up_page.dart';
import 'package:airplan/ui/pages/splash_page.dart.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => DestinationCubit(),
        ),
        BlocProvider(
          create: (context) => SeatCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/get-started': (context) => GetStartedPage(),
          '/sign-up': (context) => SignUpPage(),
          '/sign-in': (context) => SignInPage(),
          '/bonus': (context) => BonusPage(),
          '/main': (context) => MainPage(),
          '/home': (context) => HomePage(),
        },
      ),
    );
  }
}
