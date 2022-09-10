import 'package:flutter/material.dart';
import '../widget/rating.dart';
import '../../shared/theme.dart';

class NewDestinationCard extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String location;
  final double rating;
  const NewDestinationCard({
    super.key,
    required this.imgUrl,
    required this.title,
    required this.location,
    this.rating = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      padding: const EdgeInsets.only(
        top: 10,
        left: 10,
        bottom: 10,
        right: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultRadius),
        color: colorWhite,
      ),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(defaultRadius),
              image: const DecorationImage(
                image: AssetImage(
                  'assets/images/img_danau_beratan.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Danau Beratan',
                  style: blackText.copyWith(
                    fontSize: 18,
                    fontWeight: fontWeightMedium,
                  ),
                ),
                Text(
                  'Singaraja',
                  style: greyText.copyWith(
                    fontWeight: fontWeightLight,
                  ),
                ),
              ],
            ),
          ),
          Rating(
            rating: rating,
          ),
        ],
      ),
    );
  }
}
