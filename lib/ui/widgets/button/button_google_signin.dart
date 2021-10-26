import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/ui/widgets/button/base/circle_button.dart';
import 'package:food_delivery/utils/res/dimens.dart';

class ButtonGoogleSignIn extends StatelessWidget {
  ButtonGoogleSignIn({Key? key}) : super(key: key);

  final _GOOGLE_ICON = SvgPicture.asset('assets/icons/ic_google.svg',
      semanticsLabel: 'google signin', width: ICON_SIZE, height: ICON_SIZE);

  @override
  Widget build(BuildContext context) {
    return CircleButton(
      onPressed: _googleSignin,
      icon: _GOOGLE_ICON,
    );
  }

  void _googleSignin() {
    log('fake google signin');
  }
}
