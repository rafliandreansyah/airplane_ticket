import 'package:airplane_ticket/cubit/auth_cubit.dart';
import 'package:airplane_ticket/shared/theme.dart';
import 'package:airplane_ticket/ui/pages/main_page.dart';
import 'package:airplane_ticket/ui/widget/button_primary.dart';
import 'package:airplane_ticket/ui/widget/card_wallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BonusPage extends StatelessWidget {
  const BonusPage({super.key});

  static const String routeName = '/bonus-saldo';

  Widget textBonus() {
    return Column(
      children: [
        Text(
          'Big Bonus \u{1F389}',
          style: blackText.copyWith(
            fontSize: 32,
            fontWeight: fontWeightSemiBold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'We give you early credit so that\nyou can buy a flight ticket',
          style: greyText.copyWith(
            fontSize: 16,
            fontWeight: fontWeightLight,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  Widget cardBonus() {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return CardWallet(state.user);
        } else {
          return SizedBox();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final width = size.width / 1.5;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(defaultMargin),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                cardBonus(),
                const SizedBox(
                  height: 80,
                ),
                textBonus(),
                const SizedBox(
                  height: 50,
                ),
                ButtonPrimary(
                  title: 'Start Fly Now',
                  width: width,
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(MainPage.routeName);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
