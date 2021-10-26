import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/ui/widgets/button/base/circle_button.dart';
import 'package:food_delivery/utils/res/dimens.dart';

class ButtonTwitterSignIn extends StatelessWidget {
  ButtonTwitterSignIn({Key? key}) : super(key: key);

  final _TWITTER_ICON = SvgPicture.asset('assets/icons/ic_twitter.svg',
      semanticsLabel: 'google signin', width: ICON_SIZE, height: ICON_SIZE);

  @override
  Widget build(BuildContext context) {
    return CircleButton(
      onPressed: _twitterSignIn,
      icon: _TWITTER_ICON,
    );
  }

  void _twitterSignIn() {
    log('fake google signin');
  }
}