import 'package:airplane_ticket/model/destination_model.dart';
import 'package:airplane_ticket/ui/pages/detail_page.dart';
import 'package:flutter/material.dart';
import '../widget/rating.dart';
import '../../shared/theme.dart';

class NewDestinationCard extends StatelessWidget {
  final Destination destination;
  const NewDestinationCard({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(DetailPage.routeName);
      },
      child: Container(
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
                image: DecorationImage(
                  image: NetworkImage(
                    destination.imageUrl ?? '',
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
                    destination.name ?? '',
                    style: blackText.copyWith(
                      fontSize: 18,
                      fontWeight: fontWeightMedium,
                    ),
                  ),
                  Text(
                    destination.address ?? '',
                    style: greyText.copyWith(
                      fontWeight: fontWeightLight,
                    ),
                  ),
                ],
              ),
            ),
            Rating(
              rating: destination.rating ?? 0.0,
            ),
          ],
        ),
      ),
    );
  }
}
