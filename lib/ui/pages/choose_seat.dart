import 'package:airplane_ticket/shared/theme.dart';
import 'package:airplane_ticket/ui/pages/check_out_page.dart';
import 'package:airplane_ticket/ui/widget/button_primary.dart';
import 'package:airplane_ticket/ui/widget/row_seat.dart';
import 'package:flutter/material.dart';

class ChooseSeat extends StatelessWidget {
  const ChooseSeat({super.key});

  static const String routeName = '/choose-seat';

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Text(
          'Select Your\nFavorite Seat',
          style: blackText.copyWith(
            fontSize: 24,
            fontWeight: fontWeightSemiBold,
          ),
        ),
      );
    }

    Widget seatStatus() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Wrap(
          spacing: 10,
          runAlignment: WrapAlignment.start,
          runSpacing: 10,
          direction: Axis.horizontal,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 16,
                  height: 16,
                  margin: const EdgeInsets.only(right: 6),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/icon/ic_seat_available.png'),
                    ),
                  ),
                ),
                Text(
                  'Available',
                  style: blackText,
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 16,
                  height: 16,
                  margin: const EdgeInsets.only(right: 6),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/icon/ic_seat_selected.png'),
                    ),
                  ),
                ),
                Text(
                  'Selected',
                  style: blackText,
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 16,
                  height: 16,
                  margin: const EdgeInsets.only(right: 6),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/icon/ic_seat_unavailable.png'),
                    ),
                  ),
                ),
                Text(
                  'Unavailable',
                  style: blackText,
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget selectedSeat() {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 30,
        ),
        margin: const EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(
          color: colorWhite,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'A',
                    style: greyText.copyWith(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    'B',
                    style: greyText.copyWith(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    '',
                    style: greyText.copyWith(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    'C',
                    style: greyText.copyWith(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    'D',
                    style: greyText.copyWith(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            RowSeat(
              number: 1,
            ),
            const SizedBox(
              height: 16,
            ),
            RowSeat(
              number: 2,
            ),
            const SizedBox(
              height: 16,
            ),
            RowSeat(
              number: 3,
            ),
            const SizedBox(
              height: 16,
            ),
            RowSeat(
              number: 4,
            ),
            const SizedBox(
              height: 16,
            ),
            RowSeat(
              number: 5,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Your seat',
                  style: greyText.copyWith(
                    fontWeight: fontWeightLight,
                  ),
                ),
                Text(
                  'A3, B3',
                  style: blackText.copyWith(
                    fontSize: 16,
                    fontWeight: fontWeightMedium,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: greyText.copyWith(
                    fontWeight: fontWeightLight,
                  ),
                ),
                Text(
                  'IDR 540.000.000',
                  style: purpleText.copyWith(
                    fontSize: 16,
                    fontWeight: fontWeightSemiBold,
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: colorBackground,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(
            left: defaultMargin,
            right: defaultMargin,
            bottom: 30,
          ),
          children: [
            title(),
            seatStatus(),
            selectedSeat(),
            ButtonPrimary(
              title: 'Continue To Checkout',
              width: double.infinity,
              onTap: () =>
                  Navigator.of(context).pushNamed(CheckOutPage.routeName),
            ),
          ],
        ),
      ),
    );
  }
}
