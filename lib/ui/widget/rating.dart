import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class Rating extends StatelessWidget {
  final double rating;

  const Rating({super.key, this.rating = 0.0});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/icon/ic_star.png'))),
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          rating.toString(),
          style: blackText.copyWith(
            fontSize: 14,
            fontWeight: fontWeightMedium,
          ),
        )
      ],
    );
  }
}
