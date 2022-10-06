import 'package:airplane_ticket/cubit/auth_cubit.dart';
import 'package:airplane_ticket/ui/widget/destination_card.dart';
import 'package:airplane_ticket/ui/widget/new_destination_card.dart';
import 'package:airplane_ticket/ui/widget/rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String routeName = '/home-page';

  @override
  Widget build(BuildContext context) {
    Widget headerContent() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: defaultMargin,
                vertical: 30,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Howdy,\n${state.user.name}',
                          style: blackText.copyWith(
                            fontSize: 24,
                            fontWeight: fontWeightSemiBold,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Where to fly today?',
                          style: greyText.copyWith(
                            fontSize: 16,
                            fontWeight: fontWeightLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/img_profile.png',
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget popularDestincation() {
      return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DestinationCard(
              title: 'Lake Ciliwung',
              location: 'Tangerang',
              rating: 5.0,
              imgUrl: 'assets/images/img_lake_ciliwung.png',
            ),
            DestinationCard(
              title: 'White Houses',
              location: 'Spain',
              imgUrl: 'assets/images/img_white_houses.png',
              rating: 4.7,
            ),
            DestinationCard(
              title: 'Hill Heyo',
              location: 'Monaco',
              imgUrl: 'assets/images/img_hill_heyo.png',
            ),
          ],
        ),
      );
    }

    Widget newThisYear() {
      return Padding(
        padding: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 30,
          bottom: 120,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New This Year',
              style: blackText.copyWith(
                fontSize: 18,
                fontWeight: fontWeightSemiBold,
              ),
            ),
            const NewDestinationCard(
              imgUrl: 'assets/images/img_danau_beratan.png',
              title: 'Danau Beratan',
              location: 'Singaraja',
              rating: 4.7,
            ),
            const NewDestinationCard(
              imgUrl: 'assets/images/img_danau_beratan.png',
              title: 'Danau Beratan',
              location: 'Singaraja',
              rating: 4.7,
            ),
            const NewDestinationCard(
              imgUrl: 'assets/images/img_danau_beratan.png',
              title: 'Danau Beratan',
              location: 'Singaraja',
              rating: 4.7,
            ),
            const NewDestinationCard(
              imgUrl: 'assets/images/img_danau_beratan.png',
              title: 'Danau Beratan',
              location: 'Singaraja',
              rating: 4.7,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: colorBackground,
      body: ListView(
        children: [
          headerContent(),
          popularDestincation(),
          newThisYear(),
        ],
      ),
    );
  }
}
