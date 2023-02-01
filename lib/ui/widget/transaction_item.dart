import 'package:airplane_ticket/model/transaction_model.dart';
import 'package:airplane_ticket/ui/widget/photo_item.dart';
import 'package:airplane_ticket/ui/widget/rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

import '../../shared/theme.dart';
import '../../utils/number_utils.dart';
import 'booking_detail_item.dart';

class TransactionItem extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionItem(this.transaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 30,
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
          Row(
            children: [
              PhotoItem(
                imgUrl: transaction.destination.imageUrl ??
                    'assets/images/img_danau_beratan.png',
                imgUrlInternet:
                    transaction.destination.imageUrl != null ? true : false,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.destination.name ?? '-',
                      style: blackText.copyWith(
                        fontSize: 18,
                        fontWeight: fontWeightMedium,
                      ),
                    ),
                    Text(
                      transaction.destination.address ?? '-',
                      style: greyText.copyWith(
                        fontWeight: fontWeightLight,
                      ),
                    ),
                  ],
                ),
              ),
              Rating(
                rating: transaction.destination.rating ?? 0,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Booking Detail',
            style: blackText.copyWith(
              fontSize: 16,
              fontWeight: fontWeightSemiBold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // Total Person
          BookingDetailItem(
            titleDetail: 'Traveler',
            infoDetail: '${transaction.selectedSeats.length} person',
          ),
          const SizedBox(
            height: 16,
          ),
          // Info Seat
          BookingDetailItem(
            titleDetail: 'Seat',
            infoDetail: transaction.selectedSeats,
          ),
          const SizedBox(
            height: 16,
          ),
          // Status insurance
          BookingDetailItem(
            titleDetail: 'Insurance',
            infoDetail: transaction.insurance ? 'YES' : 'NO',
            color: colorGreen,
          ),
          const SizedBox(
            height: 16,
          ),
          // Refundable
          BookingDetailItem(
            titleDetail: 'Refundable',
            infoDetail: transaction.refundable ? 'YES' : 'NO',
            color: colorRed,
          ),
          const SizedBox(
            height: 16,
          ),
          // VAT
          BookingDetailItem(
            titleDetail: 'VAT',
            infoDetail:
                NumberFormat.percentPattern('ID').format(transaction.vat),
          ),
          const SizedBox(
            height: 16,
          ),
          // Price
          BookingDetailItem(
            titleDetail: 'Price',
            infoDetail: NumberUtils.currencyFormat(transaction.grandTotal),
          ),
          const SizedBox(
            height: 16,
          ),
          // Grand Total
          BookingDetailItem(
            titleDetail: 'Grand Total',
            infoDetail: NumberUtils.currencyFormat((transaction.grandTotal +
                    (transaction.grandTotal * transaction.vat))
                .toInt()),
            color: colorPrimary,
          ),
        ],
      ),
    );
  }
}
