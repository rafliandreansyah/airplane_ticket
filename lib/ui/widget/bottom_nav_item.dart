import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class BottomNavItem extends StatelessWidget {
  final String iconAsset;
  final bool isSelected;

  BottomNavItem({required this.iconAsset, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(iconAsset),
            ),
          ),
        ),
        Container(
          width: 30,
          height: 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultRadius),
            color: isSelected ? colorPrimary : colorTransparent,
          ),
        )
      ],
    );
  }
}
