import 'package:airplane_ticket/cubit/seat_cubit.dart';
import 'package:airplane_ticket/model/destination_model.dart';
import 'package:airplane_ticket/model/transaction_model.dart';
import 'package:airplane_ticket/shared/theme.dart';
import 'package:airplane_ticket/ui/pages/check_out_page.dart';
import 'package:airplane_ticket/ui/widget/button_primary.dart';
import 'package:airplane_ticket/ui/widget/seat_item.dart';
import 'package:airplane_ticket/utils/number_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseSeat extends StatelessWidget {
  const ChooseSeat({super.key});

  static const String routeName = '/choose-seat';

  @override
  Widget build(BuildContext context) {
    final destination =
        ModalRoute.of(context)!.settings.arguments as Destination;
    List<String>? selectedSeatData;
    int? grandTotal;

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
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          selectedSeatData = state;
          grandTotal = state.length * (destination.price ?? 0);
          return Container(
            padding: const EdgeInsets.symmetric(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(
                      id: 'A1',
                      isAvailable: false,
                    ),
                    SeatItem(
                      id: 'B1',
                    ),
                    SizedBox(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          '1',
                          style: greyText.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SeatItem(
                      id: 'C1',
                    ),
                    SeatItem(
                      id: 'D1',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(
                      id: 'A2',
                    ),
                    SeatItem(
                      id: 'B2',
                    ),
                    SizedBox(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          '2',
                          style: greyText.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SeatItem(
                      id: 'C2',
                    ),
                    SeatItem(
                      id: 'D2',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(
                      id: 'A3',
                    ),
                    SeatItem(
                      id: 'B3',
                    ),
                    SizedBox(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          '3',
                          style: greyText.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SeatItem(
                      id: 'C3',
                    ),
                    SeatItem(
                      id: 'D3',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(
                      id: 'A4',
                    ),
                    SeatItem(
                      id: 'B4',
                    ),
                    SizedBox(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          '4',
                          style: greyText.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SeatItem(
                      id: 'C4',
                    ),
                    SeatItem(
                      id: 'D4',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(
                      id: 'A5',
                    ),
                    SeatItem(
                      id: 'B5',
                    ),
                    SizedBox(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          '5',
                          style: greyText.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SeatItem(
                      id: 'C5',
                    ),
                    SeatItem(
                      id: 'D5',
                    ),
                  ],
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
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Text(
                        state.isEmpty ? '-' : state.join(', '),
                        style: blackText.copyWith(
                          fontSize: 16,
                          fontWeight: fontWeightMedium,
                        ),
                        textAlign: TextAlign.end,
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
                      NumberUtils.currencyFormat(state.isEmpty
                          ? 0
                          : state.length * destination.price!),
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
        },
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
              onTap: () => {
                if (grandTotal != null &&
                    selectedSeatData != null &&
                    selectedSeatData!.isNotEmpty)
                  {
                    Navigator.of(context).pushNamed(
                      CheckOutPage.routeName,
                      arguments: TransactionModel(
                        destination: destination,
                        selectedSeats: (selectedSeatData ?? ['']).join(', '),
                        grandTotal: grandTotal ?? 0,
                      ),
                    )
                  }
                else
                  {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Please Select the seat!'),
                        backgroundColor: colorRed,
                      ),
                    )
                  }
              },
            ),
          ],
        ),
      ),
    );
  }
}
