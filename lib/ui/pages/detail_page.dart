import 'package:airplane_ticket/model/destination_model.dart';
import 'package:airplane_ticket/shared/theme.dart';
import 'package:airplane_ticket/ui/pages/choose_seat.dart';
import 'package:airplane_ticket/ui/widget/button_primary.dart';
import 'package:airplane_ticket/ui/widget/interest_item.dart';
import 'package:airplane_ticket/ui/widget/photo_item.dart';
import 'package:airplane_ticket/ui/widget/rating.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  static const String routeName = '/detail';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Destination;

    Widget imageBackground() {
      return Container(
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              args.imageUrl ?? '',
            ),
            fit: BoxFit.cover,
          ),
        ),
        foregroundDecoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black.withOpacity(0.65), colorTransparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
      );
    }

    Widget emblem() {
      return SafeArea(
        child: Container(
          height: 24,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/icon/ic_emblem.png'),
            ),
          ),
        ),
      );
    }

    Widget titleDescription() {
      return SafeArea(
        child: Container(
          margin: const EdgeInsets.only(
            top: 256,
            left: 24,
            right: 24,
            bottom: 30,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  // Title And Rating
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          args.name ?? '',
                          style: whiteText.copyWith(
                            fontSize: 24,
                            fontWeight: fontWeightSemiBold,
                          ),
                        ),
                        Text(
                          args.address ?? '',
                          style: whiteText.copyWith(
                            fontSize: 16,
                            fontWeight: fontWeightLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Rating(
                    rating: args.rating ?? 0.0,
                    textStyle: whiteText,
                  ),
                ],
              ),
              // Card Container
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(
                  top: 30,
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    defaultRadius,
                  ),
                  color: colorWhite,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // About
                    Text(
                      'About',
                      style: blackText.copyWith(
                        fontSize: 16,
                        fontWeight: fontWeightSemiBold,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali.',
                      style: blackText.copyWith(
                        fontWeight: fontWeightRegular,
                        height: 1.8,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Photo Item
                    Text(
                      'Photos',
                      style: blackText.copyWith(
                        fontSize: 16,
                        fontWeight: fontWeightSemiBold,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      child: Row(
                        children: [
                          PhotoItem(imgUrl: 'assets/images/img_detail_1.png'),
                          PhotoItem(imgUrl: 'assets/images/img_detail_2.png'),
                          PhotoItem(imgUrl: 'assets/images/img_detail_3.png'),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Interest
                    Text(
                      'Interests',
                      style: blackText.copyWith(
                        fontWeight: fontWeightSemiBold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      mainAxisSpacing: 5,
                      childAspectRatio: 6,
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      children: [
                        InterestItem(title: 'Kids Park'),
                        InterestItem(title: 'Honor Bridge'),
                        InterestItem(title: 'City Museum'),
                        InterestItem(title: 'Central Mall'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'IDR 2.500.000',
                          style: blackText.copyWith(
                            fontSize: 18,
                            fontWeight: fontWeightMedium,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Per Orang',
                          style: greyText.copyWith(
                            fontWeight: fontWeightLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ButtonPrimary(
                      title: 'Book Now',
                      width: double.infinity,
                      onTap: () {
                        Navigator.of(context).pushNamed(ChooseSeat.routeName);
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: colorBackground,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            imageBackground(),
            emblem(),
            titleDescription(),
          ],
        ),
      ),
    );
  }
}
