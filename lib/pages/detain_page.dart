import 'package:cubit_app/cubit/app_cubit.dart';
import 'package:cubit_app/cubit/app_cubit_states.dart';
import 'package:cubit_app/misc/colors.dart';
import 'package:cubit_app/widgets/app_button.dart';
import 'package:cubit_app/widgets/app_large_text.dart';
import 'package:cubit_app/widgets/app_text.dart';
import 'package:cubit_app/widgets/responsive_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStar = 4;
  int SelectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      DetailState detail = state as DetailState;

      return Scaffold(
        // ignore: sized_box_for_whitespace
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'http://mark.bslmeiyu.com/uploads/' +
                                detail.place.img),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
              Positioned(
                top: 70,
                left: 20,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<AppCubits>(context).goHome();
                      },
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 320,
                child: Container(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(
                            text: detail.place.name,
                            color: Colors.black.withOpacity(0.8),
                          ),
                          AppLargeText(
                            text: '\$' + detail.place.price.toString(),
                            color: AppColors.mainColor,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: AppColors.mainColor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          AppText(
                            text: detail.place.location.toString(),
                            color: AppColors.mainColor,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              return Icon(
                                Icons.star,
                                color: index < detail.place.stars
                                    ? AppColors.starColor
                                    : AppColors.textColor2,
                              );
                            }),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const AppText(
                            text: '(5.0)',
                            color: AppColors.textColor2,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      AppLargeText(
                        text: 'People',
                        color: Colors.black.withOpacity(0.8),
                        size: 20,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const AppText(
                        text: 'Number of people in your group',
                        color: AppColors.mainTextColor,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        children: List.generate(5, (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                SelectedIndex = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: AppButtons(
                                size: 50,
                                color: SelectedIndex == index
                                    ? Colors.white
                                    : Colors.black,
                                backgroundColor: SelectedIndex == index
                                    ? Colors.black
                                    : AppColors.buttonBackground,
                                borderColor: SelectedIndex == index
                                    ? Colors.black
                                    : AppColors.buttonBackground,
                                text: (index + 1).toString(),
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AppLargeText(
                        text: 'Description',
                        color: Colors.black.withOpacity(0.8),
                        size: 20,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AppText(
                        text: detail.place.description,
                        color: AppColors.mainTextColor,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      AppButtons(
                        size: 60,
                        color: AppColors.textColor1,
                        backgroundColor: Colors.white,
                        borderColor: AppColors.textColor1,
                        isIcon: true,
                        icon: const Icon(Icons.favorite_border),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ResponsiveButton(
                        isResponsive: true,
                      )
                    ],
                  ))
            ],
          ),
        ),
      );
    });
  }
}
