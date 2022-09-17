import 'package:airplane_ticket/shared/theme.dart';
import 'package:airplane_ticket/ui/widget/interest_item.dart';
import 'package:flutter/material.dart';

class BookingDetailItem extends StatelessWidget {
  final String titleDetail;
  final String infoDetail;
  final Color? color;
  const BookingDetailItem({
    super.key,
    required this.titleDetail,
    required this.infoDetail,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InterestItem(
          title: titleDetail,
        ),
        Text(
          infoDetail,
          style: blackText.copyWith(
            color: color,
            fontWeight: fontWeightSemiBold,
          ),
        ),
      ],
    );
  }
}
