import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/utils/res/colors.dart';
import 'package:lottie/lottie.dart';

class SliderIntro extends StatefulWidget {
  const SliderIntro({Key? key}) : super(key: key);

  @override
  _SliderIntroState createState() => _SliderIntroState();
}

class _SliderIntroState extends State<SliderIntro> {
  final TEXT_WELCOME_1 = 'Order from your favorite\nstores or vendors';
  final TEXT_WELCOME_2 = 'Choose from a wide range of\ndelicious meals';
  final TEXT_WELCOME_3 = 'Enjoy instant delivery\nand payment';

  final TEXT_WELCOME_SIZE = 25.0;
  final TEXT_WELCOME_PADDING_HORIZONTAL = 30.0;
  final TEXT_WELCOME_PADDING_VERTICAL = 10.0;

  final lottieList = [
    Lottie.asset('assets/raws/food_location_finger_pointer.json'),
    Lottie.asset('assets/raws/food_carousel.json'),
    Lottie.asset('assets/raws/food_delivery.json'),
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.redAccent,
      child: Column(
        children: [
          Flexible(
              flex: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: TEXT_WELCOME_PADDING_HORIZONTAL,
                    vertical: TEXT_WELCOME_PADDING_VERTICAL),
                child: Text(
                  getTextWelcome(_currentPage),
                  style: TextStyle(
                      color: TEXT_COLOR,
                      fontSize: TEXT_WELCOME_SIZE,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.3),
                  textAlign: TextAlign.center,
                ),
              )),
          Flexible(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(top: TEXT_WELCOME_PADDING_VERTICAL),
                child: slider(),
              ))
        ],
      ),
    );
  }

  Widget slider() {
    return Column(
      children: [
        Flexible(
          flex: 8,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: PageController(initialPage: 0, keepPage: false),
            itemBuilder: (context, index) => lottieList[index],
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemCount: lottieList.length,
          ),
        ),
        Flexible(
            flex: 2,
            child: DotsIndicator(
              decorator: DotsDecorator(
                  activeColor: MAIN_COLOR_DARKER,
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0))),
              dotsCount: lottieList.length,
              position: _currentPage.toDouble(),
            ))
      ],
    );
  }

  String getTextWelcome(int n) {
    if (n == 0) return TEXT_WELCOME_1;
    if (n == 1) return TEXT_WELCOME_2;
    if (n == 2) return TEXT_WELCOME_3;
    return 'null';
  }
}

void LOGCAT(String str) => print(str);
