import 'package:airplane_ticket/cubit/page_cubit.dart';
import 'package:airplane_ticket/shared/theme.dart';
import 'package:airplane_ticket/ui/pages/setting_page.dart';
import 'package:airplane_ticket/ui/pages/transaction_page.dart';
import 'package:airplane_ticket/ui/pages/wallet_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widget/bottom_nav_item.dart';
import '../pages/home_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static const String routeName = '/main';

  @override
  Widget build(BuildContext context) {
    Widget buildPage(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const TransactionPage();
        case 2:
          return const WalletPage();
        case 3:
          return const SettingPage();
        default:
          return const HomePage();
      }
    }

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
                index: 0,
                iconAsset: 'assets/icon/ic_home_active.png',
              ),
              BottomNavItem(
                index: 1,
                iconAsset: 'assets/icon/ic_booking.png',
              ),
              BottomNavItem(
                index: 2,
                iconAsset: 'assets/icon/ic_card.png',
              ),
              BottomNavItem(
                index: 3,
                iconAsset: 'assets/icon/ic_setting.png',
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndexState) {
        return Scaffold(
          backgroundColor: colorBackground,
          body: SafeArea(
            child: Stack(
              children: [
                buildPage(currentIndexState),
                customBottomNavigation(),
              ],
            ),
          ),
        );
      },
    );
  }
}
