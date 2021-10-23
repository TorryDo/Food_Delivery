import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery/ui/widgets/text_orange_bold.dart';

class AppbarWelcome extends StatelessWidget {
  const AppbarWelcome({Key? key}) : super(key: key);

  final SKIP = 'Skip';
  final TOP_BAR_HEIGHT = 80.0;

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
              alignment: const Alignment(0.8, 0.0),
              child: TextOrangeBold(text: SKIP))
        ]));
  }
}
