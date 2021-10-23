import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/widgets/button_orange_fullwidth.dart';
import 'package:food_delivery/widgets/slider_intro.dart';
import 'package:food_delivery/widgets/text_orange_bold.dart';

class FirstLaunchScreen extends StatelessWidget {
  const FirstLaunchScreen({Key? key}) : super(key: key);

  final TOP_BAR_HEIGHT = 80.0;

  final SKIP = 'Skip';

  final TEXT_AND_SLIDER_PADDING_VERTICAL = 25.0;

  final BUTTON_CREATE_ACCOUNT = 'Create an account';
  final TEXT_LOGIN = 'Login';

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SafeArea(
          child: Column(children: [
            SizedBox(
                width: double.infinity,
                height: TOP_BAR_HEIGHT,
                child: topBar()),
            Flexible(flex: 7, child: Padding(
              padding: EdgeInsets.only(top: TEXT_AND_SLIDER_PADDING_VERTICAL),
              child: const SliderIntro(),
            )),
            Flexible(flex: 3, child: createAccountOrLogin())
          ]),
        ));
  }

  Widget createAccountOrLogin() {
    return Column(
      children: [
        ButtonOrangeFullWidth(text: BUTTON_CREATE_ACCOUNT),
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: TextOrangeBold(text: TEXT_LOGIN),
        )
      ],
    );
  }


  Widget topBar() {
    return Stack(alignment: AlignmentDirectional.center, children: <Widget>[
      Align(
          alignment: Alignment.center,
          child: SvgPicture.asset('assets/icons/ic_applogo.svg',
              semanticsLabel: 'app logo')),
      Align(
          alignment: const Alignment(0.8, 0.0),
          child: TextOrangeBold(text: SKIP))
    ]);
  }
}
