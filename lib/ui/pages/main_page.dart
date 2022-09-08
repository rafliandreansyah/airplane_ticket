import 'package:airplane_ticket/shared/theme.dart';
import 'package:flutter/material.dart';
import '../widget/bottom_nav_item.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static const String routeName = '/main';

  @override
  Widget build(BuildContext context) {
    Widget customBottomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(
            left: defaultMargin,
            right: defaultMargin,
            bottom: 30,
          ),
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultRadius),
            color: colorWhite,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNavItem(
                iconAsset: 'assets/icon/ic_home_active.png',
                isSelected: true,
              ),
              BottomNavItem(iconAsset: 'assets/icon/ic_booking.png'),
              BottomNavItem(iconAsset: 'assets/icon/ic_card.png'),
              BottomNavItem(iconAsset: 'assets/icon/ic_setting.png'),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: colorBackground,
      body: Stack(
        children: [
          customBottomNavigation(),
        ],
      ),
    );
  }
}
