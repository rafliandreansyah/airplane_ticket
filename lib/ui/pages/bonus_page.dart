import 'package:airplane_ticket/cubit/auth_cubit.dart';
import 'package:airplane_ticket/shared/theme.dart';
import 'package:airplane_ticket/ui/pages/main_page.dart';
import 'package:airplane_ticket/ui/widget/button_primary.dart';
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
          return Container(
            width: 300,
            height: 211,
            padding: EdgeInsets.all(defaultMargin),
            decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/img_card.png'),
                ),
                boxShadow: [
                  BoxShadow(
                    color: colorPrimary.withOpacity(0.6),
                    blurRadius: 50,
                    offset: const Offset(
                      0,
                      10,
                    ),
                  ),
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name',
                            style: whiteText.copyWith(
                              fontWeight: fontWeightLight,
                            ),
                          ),
                          Text(
                            state.user.name,
                            style: whiteText.copyWith(
                              fontSize: 18,
                              fontWeight: fontWeightMedium,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/icon/ic_logo.png',
                          width: 24,
                          height: 24,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Pay',
                          style: whiteText.copyWith(
                            fontSize: 16,
                            fontWeight: fontWeightMedium,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Balance',
                        style: whiteText.copyWith(
                          fontSize: 14,
                          fontWeight: fontWeightMedium,
                        ),
                      ),
                      Text(
                        'IDR ${state.user.balance}',
                        style: whiteText.copyWith(
                          fontSize: 26,
                          fontWeight: fontWeightMedium,
                        ),
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
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
