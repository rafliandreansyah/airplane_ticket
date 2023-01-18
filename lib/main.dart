import 'package:airplane_ticket/cubit/auth_cubit.dart';
import 'package:airplane_ticket/cubit/destination_cubit.dart';
import 'package:airplane_ticket/cubit/page_cubit.dart';
import 'package:airplane_ticket/ui/pages/bonus_page.dart';
import 'package:airplane_ticket/ui/pages/check_out_page.dart';
import 'package:airplane_ticket/ui/pages/choose_seat.dart';
import 'package:airplane_ticket/ui/pages/detail_page.dart';
import 'package:airplane_ticket/ui/pages/home_page.dart';
import 'package:airplane_ticket/ui/pages/main_page.dart';
import 'package:airplane_ticket/ui/pages/sign_in_page.dart';
import 'package:airplane_ticket/ui/pages/sign_up_page.dart';
import 'package:airplane_ticket/ui/pages/success.page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:airplane_ticket/ui/pages/splash_page.dart';
import 'package:airplane_ticket/ui/pages/get_started_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: ((context) => AuthCubit()),
        ),
        BlocProvider(
          create: (context) => DestinationCubit(),
        )
      ],
      child: MaterialApp(
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
          SignInPage.routeName: (context) => const SignInPage(),
        },
      ),
    );
  }
}
