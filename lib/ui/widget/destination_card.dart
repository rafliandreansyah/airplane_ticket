import 'package:airplane_ticket/model/destination_model.dart';
import 'package:airplane_ticket/ui/pages/detail_page.dart';
import 'package:flutter/material.dart';

import '../../shared/theme.dart';
import '../widget/rating.dart';

class DestinationCard extends StatelessWidget {
  final Destination destination;

  DestinationCard({
    super.key,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(DetailPage.routeName, arguments: destination),
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
                    destination.imageUrl ?? '',
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
                      rating: destination.rating ?? 0.0,
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
                    destination.name ?? '',
                    style: blackText.copyWith(
                      fontSize: 18,
                      fontWeight: fontWeightMedium,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    destination.address ?? '',
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
