import 'package:airplane_ticket/cubit/seat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';

class SeatItem extends StatelessWidget {
  String id;
  bool isAvailable;
  SeatItem({
    super.key,
    required this.id,
    this.isAvailable = true,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<SeatCubit>().isSelected(id);

    Color background() {
      if (!isAvailable) {
        return colorUnavailable;
      } else {
        if (isSelected) {
          return colorPrimary;
        } else {
          return colorPrimary.withOpacity(0.3);
        }
      }
    }

    Color borderColor() {
      if (!isAvailable) {
        return colorUnavailable;
      } else {
        return colorPrimary;
      }
    }

    Widget seatItem() {
      var decoration = BoxDecoration(
        border: Border.all(
          width: 2,
          color: borderColor(),
        ),
        color: background(),
        borderRadius: BorderRadius.circular(15),
      );

      return GestureDetector(
        onTap: () {
          if (isAvailable) {
            context.read<SeatCubit>().addSeat(id);
          }
        },
        child: Container(
            width: 48,
            height: 48,
            decoration: decoration,
            child: isAvailable && isSelected
                ? Center(
                    child: Text(
                      'YOU',
                      style: whiteText.copyWith(
                        fontWeight: fontWeightSemiBold,
                      ),
                    ),
                  )
                : null),
      );
    }

    return seatItem();
  }
}
