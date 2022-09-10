import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class InterestItem extends StatelessWidget {
  final String title;

  InterestItem({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/icon/ic_checked.png'),
            ),
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          title,
          style: blackText.copyWith(
            fontWeight: fontWeightRegular,
          ),
        ),
      ],
    );
  }
}
