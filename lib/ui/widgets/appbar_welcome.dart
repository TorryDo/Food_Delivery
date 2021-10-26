import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery/utils/constant.dart';
import 'package:food_delivery/utils/res/dimens.dart';

class AppbarWelcome extends StatelessWidget {
  const AppbarWelcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: TOP_BAR_HEIGHT,
        child: Stack(alignment: AlignmentDirectional.center, children: <Widget>[
          Align(
              alignment: Alignment.center,
              child: SvgPicture.asset('assets/icons/ic_applogo.svg',
                  semanticsLabel: 'app logo')),
          Align(
              alignment: const Alignment(-0.9, 0.0),
              child: IC_LEFT_ARROW
          )
        ]));
  }
}
