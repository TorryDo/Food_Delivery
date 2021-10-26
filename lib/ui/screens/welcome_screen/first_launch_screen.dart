import 'package:flutter/material.dart';
import 'package:food_delivery/ui/widgets/appbar_welcome.dart';
import 'package:food_delivery/ui/widgets/button/button_orange_fullwidth.dart';
import 'package:food_delivery/ui/widgets/slider_intro.dart';
import 'package:food_delivery/ui/widgets/text/text_orange_bold.dart';


class FirstLaunchScreen extends StatelessWidget {
  const FirstLaunchScreen({Key? key}) : super(key: key);

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
            const AppbarWelcome(),
            Flexible(
                flex: 7,
                child: Padding(
                  padding:
                      EdgeInsets.only(top: TEXT_AND_SLIDER_PADDING_VERTICAL),
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
}
