import 'package:flutter/material.dart';

import 'package:airplane_ticket/shared/theme.dart';

class TextFieldDefault extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String? hintText;
  final bool? obscureText;
  final Widget? suffixIcon;

  const TextFieldDefault({
    required this.controller,
    required this.title,
    this.hintText,
    this.obscureText,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: blackText.copyWith(
                fontSize: 14,
                fontWeight: fontWeightRegular,
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              height: 6,
            ),
            TextField(
              obscureText: obscureText ?? false,
              controller: controller,
              cursorColor: colorBlack,
              cursorWidth: 1,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: colorPrimary,
                  ),
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
                hintText: hintText ?? '',
                hintStyle: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 16,
                  fontWeight: fontWeightLight,
                ),
                suffixIcon: suffixIcon,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
