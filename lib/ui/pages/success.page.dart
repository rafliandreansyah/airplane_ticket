import 'package:airplane_ticket/shared/theme.dart';
import 'package:airplane_ticket/ui/pages/main_page.dart';
import 'package:airplane_ticket/ui/widget/button_primary.dart';
import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  static const String routeName = '/success-page';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    return Scaffold(
      backgroundColor: colorBackground,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  bottom: 80,
                ),
                child: Image.asset(
                  'assets/icon/ic_success_booked.png',
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                'Well Booked 😍',
                style: blackText.copyWith(
                  fontSize: 32,
                  fontWeight: fontWeightSemiBold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Are you ready to explore the new world of experiences?',
                style: greyText.copyWith(
                  fontSize: 16,
                  fontWeight: fontWeightLight,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
              ButtonPrimary(
                title: 'My Bookings',
                width: width / 1.8,
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      MainPage.routeName, (route) => false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
