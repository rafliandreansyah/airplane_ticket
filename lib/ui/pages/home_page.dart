import 'package:airplane_ticket/cubit/auth_cubit.dart';
import 'package:airplane_ticket/cubit/destination_cubit.dart';
import 'package:airplane_ticket/ui/widget/destination_card.dart';
import 'package:airplane_ticket/ui/widget/new_destination_card.dart';
import 'package:airplane_ticket/ui/widget/rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/destination_model.dart';
import '../../shared/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routeName = '/home-page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<DestinationCubit>().getDestination();
    super.initState();
  }

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

    Widget popularDestination(List<Destination> destinations) {
      return SizedBox(
        height: 330,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: destinations.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, index) => DestinationCard(
            title: destinations[index].name!,
            location: destinations[index].address!,
            imgUrl: destinations[index].imageUrl!,
            rating: destinations[index].rating!,
          ),
        ),
      );
    }

    Widget newThisYear(List<Destination> destinations) {
      return Padding(
        padding: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 30,
          bottom: 120,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: destinations
              .map((e) => NewDestinationCard(destination: e))
              .toList(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: colorBackground,
      body: BlocConsumer<DestinationCubit, DestinationState>(
        listener: (context, state) {
          if (state is DestinationError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
            print(state.error);
          }
        },
        builder: (context, state) {
          if (state is DestinationSuccess) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  headerContent(),
                  popularDestination(state.destination),
                  newThisYear(state.destination),
                ],
              ),
            );
          }
          return Container(child: Center(child: CircularProgressIndicator()));
        },
      ),
    );
  }
}
