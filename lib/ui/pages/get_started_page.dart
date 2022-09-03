import 'package:airplane_ticket/shared/theme.dart';
import 'package:flutter/material.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var width = size.width / 1.2;

    return Scaffold(
      body: Stack(children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/img_get_started.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 80,
              left: 40,
              right: 40,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Fly Like a Bird',
                  style: whiteText.copyWith(
                    fontSize: 31,
                    fontWeight: fontWeightSemiBold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Explore new world with us and let yourself get an amazing experiences',
                  style: whiteText.copyWith(
                    fontSize: 16,
                    fontWeight: fontWeightLight,
                  ),
                  textAlign: TextAlign.center,
                ),
                InkWell(
                  child: Container(
                    width: width,
                    margin: const EdgeInsets.only(
                      top: 50,
                    ),
                    decoration: BoxDecoration(
                      color: colorPrimary,
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 14,
                      ),
                      child: Text(
                        'Get Started',
                        textAlign: TextAlign.center,
                        style: whiteText.copyWith(
                          fontSize: 18,
                          fontWeight: fontWeightMedium,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {},
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
