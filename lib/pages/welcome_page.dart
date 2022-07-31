import 'package:cubit_app/cubit/app_cubit.dart';
import 'package:cubit_app/misc/colors.dart';
import 'package:cubit_app/widgets/app_large_text.dart';
import 'package:cubit_app/widgets/app_text.dart';
import 'package:cubit_app/widgets/responsive_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List image = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: image.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (_, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                  // ignore: prefer_interpolation_to_compose_strings
                  image: AssetImage('img/' + image[index]),
                  fit: BoxFit.cover),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppLargeText(
                        text: 'Trips',
                      ),
                      const AppText(
                        text: 'Mountains',
                        size: 30,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // ignore: sized_box_for_whitespace
                      Container(
                        width: 250,
                        child: const AppText(
                          text:
                              'Mountains hikes give you a chance to experience the world of nature.',
                          size: 14,
                          color: AppColors.textColor2,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<AppCubits>(context).getData();
                        },
                        child: Container(
                          width: 200,
                          child: Row(
                            children: const [
                              ResponsiveButton(
                                width: 120,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: List.generate(3, (indexDots) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        width: 8,
                        height: index == indexDots ? 30 : 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: index == indexDots
                              ? AppColors.mainColor
                              : AppColors.mainColor.withOpacity(0.3),
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
