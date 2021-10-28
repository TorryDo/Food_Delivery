import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/ui/widgets/button/base/text_highlight_button.dart';
import 'package:food_delivery/ui/widgets/button/button_facebook_signin.dart';
import 'package:food_delivery/ui/widgets/button/button_google_signin.dart';
import 'package:food_delivery/ui/widgets/button/button_orange_fullwidth.dart';
import 'package:food_delivery/ui/widgets/button/button_twitter_signin.dart';
import 'package:food_delivery/utils/res/colors.dart';
import 'package:food_delivery/utils/res/dimens.dart';

/// 3 circle buttons, orangeButton and textButton on signup/login screen
class ThreeButtons extends StatelessWidget {

  final Function? buttonOrangeClicked;

  const ThreeButtons({Key? key, this.buttonOrangeClicked}) : super(key: key);

  final strGoogleSignIn = 'Sign-in with Google';
  final strBtnFullWidth = 'Create an Account';
  final _ALREADY_HAVE_AN_ACCOUNT = 'Already have an account?';
  final _SIGNIN = 'SignIn';

  final COLOR_BTN_GOOGLE = TEXT_COLOR_INVERSED;

  @override
  Widget build(BuildContext context) {
    return _threeButtons();
  }

  _threeButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _threeOptionSignin(),
        _gradientButtonFullWidth(),
        _textHighlightButtonFullWidth(),
        const SizedBox(height: SPACER_XL)
      ],
    );
  }

  _threeOptionSignin() {
    return FractionallySizedBox(
      widthFactor: 0.5,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ButtonGoogleSignIn(),
          ButtonFacebookSignIn(),
          ButtonTwitterSignIn(),
        ],
      ),
    );
  }

  _gradientButtonFullWidth() {
    return ButtonOrangeFullWidth(
        text: strBtnFullWidth, onCLick: buttonOrangeClicked);
  }

  _textHighlightButtonFullWidth() {
    return Align(
        alignment: Alignment.center,
        child: TextButtonHighlight(
          firstText: _ALREADY_HAVE_AN_ACCOUNT,
          lastText: _SIGNIN,
          onPressed: () => log('signin click'),
        ));
  }
}
