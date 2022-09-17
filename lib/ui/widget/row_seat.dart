import 'package:airplane_ticket/ui/widget/seat_item.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class RowSeat extends StatelessWidget {
  final int number;
  const RowSeat({
    super.key,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SeatItem(
          status: 0,
        ),
        SeatItem(
          status: 0,
        ),
        Container(
          width: 48,
          height: 48,
          child: Center(
            child: Text(
              '$number',
              style: greyText.copyWith(
                fontSize: 16,
              ),
            ),
          ),
        ),
        SeatItem(
          status: 1,
        ),
        SeatItem(
          status: 2,
        ),
      ],
    );
  }
}
