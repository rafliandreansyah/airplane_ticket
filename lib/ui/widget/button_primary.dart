import 'package:flutter/material.dart';

import 'package:airplane_ticket/shared/theme.dart';

class ButtonPrimary extends StatelessWidget {
  final VoidCallback? onTap;
  final double? width;
  final String? title;

  ButtonPrimary(
      {required this.title, required this.width, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: colorPrimary,
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(defaultRadius),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 14,
            ),
            child: Text(
              title ?? '',
              textAlign: TextAlign.center,
              style: whiteText.copyWith(
                fontSize: 18,
                fontWeight: fontWeightMedium,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
