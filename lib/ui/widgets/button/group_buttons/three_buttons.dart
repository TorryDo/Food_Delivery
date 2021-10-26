import 'dart:developer';

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

  VoidCallback? buttonOrangeClicked;

  ThreeButtons({Key? key, this.buttonOrangeClicked}) : super(key: key);

  final strGoogleSignIn = 'Sign-in with Google';
  final String strBtnFullWidth = 'Create an Account';
  final String _ALREADY_HAVE_AN_ACCOUNT = 'Already have an account?';
  final String _SIGNIN = 'SignIn';

  final COLOR_BTN_GOOGLE = TEXT_COLOR_INVERSED;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _ThreeOptionSignin(),
          _GradientButtonFullWidth(),
          _TextHightlightButtonFullWidth(),
          const SizedBox(height: SPACER_XL)
        ],
      ),
    );
  }

  Widget _ThreeOptionSignin() {
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

  Widget _GradientButtonFullWidth() {
    return ButtonOrangeFullWidth(text: strBtnFullWidth, onCLick: buttonOrangeClicked,);
  }

  Widget _TextHightlightButtonFullWidth() {
    return Align(
        alignment: Alignment.center,
        child: TextButtonHighlight(
            firstText: _ALREADY_HAVE_AN_ACCOUNT,
            lastText: _SIGNIN,
          onPressed: () => log('signin click'),
        )
    );
  }

  void CreateAccountClick() {
    print('create account click');
  }

  void LoginClick() {
    print('login click');
  }
}
