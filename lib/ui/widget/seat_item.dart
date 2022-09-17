import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class SeatItem extends StatelessWidget {
  int status;
  SeatItem({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    Widget seatItem() {
      var decoration;
      if (status == 0) {
        decoration = BoxDecoration(
          border: Border.all(
            width: 2,
            color: colorPrimary,
          ),
          color: colorPrimary.withOpacity(0.3),
          borderRadius: BorderRadius.circular(15),
        );
      } else if (status == 1) {
        decoration = BoxDecoration(
          color: colorPrimary,
          borderRadius: BorderRadius.circular(15),
        );
      } else {
        decoration = BoxDecoration(
          color: colorUnavailable,
          borderRadius: BorderRadius.circular(15),
        );
      }

      return Container(
          width: 48,
          height: 48,
          decoration: decoration,
          child: status == 1
              ? Center(
                  child: Text(
                    'YOU',
                    style: whiteText.copyWith(
                      fontWeight: fontWeightSemiBold,
                    ),
                  ),
                )
              : null);
    }

    return seatItem();
  }
}
