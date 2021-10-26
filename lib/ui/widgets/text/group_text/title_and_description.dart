import 'package:flutter/widgets.dart';
import 'package:food_delivery/utils/res/colors.dart';

class TitleAndDescription extends StatelessWidget {
  const TitleAndDescription(
      {Key? key, required this.title, required this.description})
      : super(key: key);

  final String title;
  final String description;

  final _MARGIN_HORIZONTALLY = 40.0;

  final _COLOR_TITLE = TEXT_COLOR;
  final _SIZE_TITLE = 30.0;
  final _SIZE_DESCRIPTION = 15.0;

  final _SPACE = 20.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: _MARGIN_HORIZONTALLY),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  color: _COLOR_TITLE,
                  fontSize: _SIZE_TITLE,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: _SPACE),
          Text(description,
              style:
                  TextStyle(color: _COLOR_TITLE, fontSize: _SIZE_DESCRIPTION))
        ],
      ),
    );
  }
}
