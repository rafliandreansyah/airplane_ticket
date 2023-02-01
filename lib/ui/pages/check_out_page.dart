import 'package:airplane_ticket/cubit/page_cubit.dart';
import 'package:airplane_ticket/cubit/seat_cubit.dart';
import 'package:airplane_ticket/cubit/transaction_cubit.dart';
import 'package:airplane_ticket/model/transaction_model.dart';
import 'package:airplane_ticket/shared/theme.dart';
import 'package:airplane_ticket/ui/pages/success.page.dart';
import 'package:airplane_ticket/ui/widget/booking_detail_item.dart';
import 'package:airplane_ticket/ui/widget/button_primary.dart';
import 'package:airplane_ticket/ui/widget/photo_item.dart';
import 'package:airplane_ticket/ui/widget/transaction_item.dart';
import 'package:airplane_ticket/utils/number_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../cubit/auth_cubit.dart';
import '../widget/rating.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({super.key});

  static final String routeName = '/check-out';

  @override
  Widget build(BuildContext context) {
    final transaction =
        ModalRoute.of(context)!.settings.arguments as TransactionModel;

    List<String> seats = transaction.selectedSeats.split(',');

    Widget destinationFromTo() {
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              bottom: 10,
              left: 16,
              right: 16,
            ),
            child: Image.asset(
              'assets/icon/ic_checkout.png',
              fit: BoxFit.fill,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CGK',
                    style: blackText.copyWith(
                      fontSize: 24,
                      fontWeight: fontWeightSemiBold,
                    ),
                  ),
                  Text(
                    'Tangerang',
                    style: greyText.copyWith(
                      fontWeight: fontWeightLight,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'TLC',
                    style: blackText.copyWith(
                      fontSize: 24,
                      fontWeight: fontWeightSemiBold,
                    ),
                  ),
                  Text(
                    'Ciliwung',
                    style: greyText.copyWith(
                      fontWeight: fontWeightLight,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      );
    }

    Widget paymentDetail() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: const EdgeInsets.only(
                bottom: 30,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              decoration: BoxDecoration(
                color: colorWhite,
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment Details',
                    style: blackText.copyWith(
                        fontWeight: fontWeightSemiBold, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 70,
                        margin: const EdgeInsets.only(
                          right: 16,
                        ),
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage(
                              'assets/images/img_card.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(
                            defaultRadius,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              margin: const EdgeInsets.only(
                                right: 6,
                              ),
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/icon/ic_logo.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Text(
                              'Pay',
                              style: whiteText.copyWith(
                                fontSize: 16,
                                fontWeight: fontWeightMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              NumberUtils.currencyFormat(state.user.balance),
                              style: blackText.copyWith(
                                fontSize: 18,
                                fontWeight: fontWeightMedium,
                              ),
                            ),
                            Text(
                              'Current Balance',
                              style: greyText.copyWith(
                                fontWeight: fontWeightLight,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget btnTac() {
      return GestureDetector(
        onTap: () {},
        child: Text(
          'Terms and Conditions',
          style: greyText.copyWith(
            fontSize: 16,
            fontWeight: fontWeightLight,
            decoration: TextDecoration.underline,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    return Scaffold(
      backgroundColor: colorBackground,
      body: SafeArea(
        child: BlocConsumer<TransactionCubit, TransactionState>(
          listener: (context, state) {
            if (state is TransactionSuccess) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                SuccessPage.routeName,
                (route) => false,
              );
              context.read<SeatCubit>().clearSeatSelection();
            } else if (state is TransactionFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is TransactionLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView(
              padding: EdgeInsets.only(
                top: 30,
                left: defaultMargin,
                right: defaultMargin,
                bottom: 30,
              ),
              children: [
                destinationFromTo(),
                TransactionItem(transaction),
                paymentDetail(),
                ButtonPrimary(
                  title: 'Pay Now',
                  width: double.infinity,
                  onTap: () {
                    context.read<PageCubit>().changePage(1);
                    context
                        .read<TransactionCubit>()
                        .createTransaction(transaction);
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                btnTac(),
              ],
            );
          },
        ),
      ),
    );
  }
}
