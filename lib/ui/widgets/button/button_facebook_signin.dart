import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/ui/widgets/button/base/circle_button.dart';
import 'package:food_delivery/utils/res/dimens.dart';

class ButtonFacebookSignIn extends StatelessWidget {
  ButtonFacebookSignIn({Key? key}) : super(key: key);

  final _FACEBOOK_ICON = SvgPicture.asset('assets/icons/ic_facebook.svg',
      semanticsLabel: 'google signin', width: ICON_SIZE, height: ICON_SIZE);

  @override
  Widget build(BuildContext context) {
    return CircleButton(
      onPressed: _facebookSignIn,
      icon: _FACEBOOK_ICON,
    );
  }

  void _facebookSignIn() {
    log('fake google signin');
  }
}