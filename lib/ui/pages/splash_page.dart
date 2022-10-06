import 'dart:async';

import 'package:airplane_ticket/cubit/auth_cubit.dart';
import 'package:airplane_ticket/ui/pages/get_started_page.dart';
import 'package:airplane_ticket/ui/pages/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        Navigator.of(context).pushReplacementNamed(GetStartedPage.routeName);
      } else {
        context.read<AuthCubit>().getUserById(user.uid);
        Navigator.of(context)
            .pushNamedAndRemoveUntil(MainPage.routeName, (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              margin: const EdgeInsets.only(bottom: 50),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icon/ic_logo.png'),
                ),
              ),
            ),
            Text(
              'AIRPLANE',
              style: whiteText.copyWith(
                fontSize: 32,
                letterSpacing: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
