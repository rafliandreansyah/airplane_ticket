import 'package:airplane_ticket/cubit/page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';

class BottomNavItem extends StatelessWidget {
  final String iconAsset;
  final int index;

  BottomNavItem({required this.iconAsset, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<PageCubit>().changePage(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Image.asset(
            iconAsset,
            width: 24,
            height: 24,
            color: context.read<PageCubit>().state == index
                ? colorPrimary
                : colorGrey,
          ),
          Container(
            width: 30,
            height: 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(defaultRadius),
              color: context.read<PageCubit>().state == index
                  ? colorPrimary
                  : colorTransparent,
            ),
          )
        ],
      ),
    );
  }
}
