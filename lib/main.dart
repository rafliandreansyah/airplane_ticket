import 'package:airplane_ticket/ui/pages/bonus_page.dart';
import 'package:airplane_ticket/ui/pages/check_out_page.dart';
import 'package:airplane_ticket/ui/pages/choose_seat.dart';
import 'package:airplane_ticket/ui/pages/detail_page.dart';
import 'package:airplane_ticket/ui/pages/home_page.dart';
import 'package:airplane_ticket/ui/pages/main_page.dart';
import 'package:airplane_ticket/ui/pages/sign_up_page.dart';
import 'package:airplane_ticket/ui/pages/success.page.dart';
import 'package:flutter/material.dart';

import 'package:airplane_ticket/ui/pages/splash_page.dart';
import 'package:airplane_ticket/ui/pages/get_started_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter airplane',
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),
        GetStartedPage.routeName: (context) => const GetStartedPage(),
        SignUpPage.routeName: (context) => SignUpPage(),
        BonusPage.routeName: (context) => const BonusPage(),
        MainPage.routeName: (context) => const MainPage(),
        HomePage.routeName: (context) => const HomePage(),
        DetailPage.routeName: (context) => const DetailPage(),
        ChooseSeat.routeName: (context) => const ChooseSeat(),
        CheckOutPage.routeName: (context) => const CheckOutPage(),
        SuccessPage.routeName: (context) => const SuccessPage(),
      },
    );
  }
}
