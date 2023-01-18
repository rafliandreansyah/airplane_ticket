import 'package:airplane_ticket/ui/pages/detail_page.dart';
import 'package:flutter/material.dart';

import '../../shared/theme.dart';
import '../widget/rating.dart';

class DestinationCard extends StatelessWidget {
  String title;
  String imgUrl;
  String location;
  double rating;

  DestinationCard(
      {super.key,
      required this.title,
      required this.location,
      required this.imgUrl,
      this.rating = 0.0});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(DetailPage.routeName),
      child: Container(
        margin: EdgeInsets.only(right: defaultMargin),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colorWhite,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 180,
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultRadius),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    imgUrl,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: colorWhite,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(defaultRadius),
                      ),
                    ),
                    child: Rating(
                      rating: rating,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 20,
                left: 10,
                right: 10,
                bottom: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: blackText.copyWith(
                      fontSize: 18,
                      fontWeight: fontWeightMedium,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    location,
                    style: greyText.copyWith(
                      fontSize: 14,
                      fontWeight: fontWeightRegular,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
