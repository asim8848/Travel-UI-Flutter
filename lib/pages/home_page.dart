import 'package:cubit_app/cubit/app_cubit.dart';
import 'package:cubit_app/cubit/app_cubit_states.dart';
import 'package:cubit_app/widgets/app_large_text.dart';
import 'package:cubit_app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../misc/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    'balloning.png': 'Balloning',
    'hiking.png': 'Hiking',
    'kayaking.png': 'Kayaking',
    'snorkling.png': 'Snorkling',
  };
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(body: BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        if (state is LoadedState) {
          var info = state.places;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Menu Text
              Container(
                padding: const EdgeInsets.only(top: 60, left: 20),
                child: Row(
                  children: [
                    const Icon(
                      Icons.menu,
                      color: Colors.black,
                      size: 30,
                    ),
                    Expanded(child: Container()),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.5)),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 40.0,
              ),
              //Discover Text
              Container(
                margin: const EdgeInsets.only(
                  left: 20,
                ),
                child: const AppLargeText(text: 'Discover'),
              ),
              //TabBar
              const SizedBox(
                height: 20.0,
              ),
              // ignore: sized_box_for_whitespace
              Container(
                height: 50,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    labelPadding: const EdgeInsets.only(left: 20, right: 20),
                    controller: tabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: const CircleTabIndicator(
                        color: AppColors.mainColor, radius: 4),
                    tabs: const [
                      Text('Places'),
                      Text('Places'),
                      Text('Places'),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                height: 300.0,
                width: double.maxFinite,
                child: TabBarView(
                  controller: tabController,
                  children: [
                    ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: info.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppCubits>(context)
                                .detailPage(info[index]);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 15, top: 10),
                            width: 200,
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                image: NetworkImage(
                                    'http://mark.bslmeiyu.com/uploads/' +
                                        info[index].img),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const Text('These'),
                    const Text('eve'),
                  ],
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    AppLargeText(
                      text: 'Explore more',
                      size: 22,
                    ),
                    AppText(
                      text: 'See all',
                      color: AppColors.textColor1,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                height: 120,
                width: double.maxFinite,
                margin: const EdgeInsets.only(left: 20),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (_, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 30),
                        child: Column(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: AssetImage(
                                      'img/${images.keys.elementAt(index)}'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // ignore: avoid_unnecessary_containers
                            Container(
                              child: AppText(
                                text: images.values.elementAt(index),
                                color: AppColors.textColor2,
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    ));
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;
  const CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _circlePainter(color: color, radius: radius);
  }
}

// ignore: camel_case_types
class _circlePainter extends BoxPainter {
  final Color color;
  double radius;

  _circlePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height + 5);
    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
