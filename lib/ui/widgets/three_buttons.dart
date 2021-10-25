import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/ui/widgets/button_orange_fullwidth.dart';
import 'package:food_delivery/utils/res/colors.dart';
import 'package:food_delivery/utils/res/dimens.dart';

class ThreeButtons extends StatelessWidget {
  const ThreeButtons({Key? key}) : super(key: key);

  final strGoogleSignIn = 'Sign-in with Google';
  final String strBtnFullWidth = 'Create an Account';
  final String strBtnOnlyText = 'Login to my Account';

  final COLOR_BTN_GOOGLE = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: PADDING_HORIZONTALLY_XXXL),
            child: SizedBox(
              width: double.infinity,
              height: BUTTON_HEIGHT_L,
              child: ElevatedButton(
                onPressed: () => GoogleSignIn(),
                child: Text(strGoogleSignIn,
                    style: const TextStyle(color: TEXT_COLOR)),
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(ELEVATION_XS),
                    backgroundColor:
                        MaterialStateProperty.all(COLOR_BTN_GOOGLE),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(BORDER_RADIUS_L)))),
              ),
            ),
          ),
          ButtonOrangeFullWidth(text: strBtnFullWidth),
          TextButton(
              onPressed: LoginClick,
              child: Text(strBtnOnlyText,
                  style: const TextStyle(
                      color: TEXT_COLOR_MAIN, fontSize: FONT_SIZE_L))),
          const SizedBox(height: SPACER_XL)
        ],
      ),
    );
  }

  void GoogleSignIn() {
    print('Google sign in');
  }

  void CreateAccountClick() {
    print('create account click');
  }

  void LoginClick() {
    print('login click');
  }
}
