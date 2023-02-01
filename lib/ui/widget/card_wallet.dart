import 'package:airplane_ticket/model/user_model.dart';
import 'package:airplane_ticket/utils/number_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../shared/theme.dart';

class CardWallet extends StatelessWidget {
  final UserModel user;
  const CardWallet(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
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
                      user.name,
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
                  NumberUtils.currencyFormat(user.balance),
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
    ;
  }
}
