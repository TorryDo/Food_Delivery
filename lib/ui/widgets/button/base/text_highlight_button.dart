import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/utils/res/colors.dart';
import 'package:food_delivery/utils/res/dimens.dart';

class TextButtonHighlight extends StatelessWidget {
  const TextButtonHighlight(
      {Key? key,
      this.onPressed,
      required this.firstText,
      required this.lastText})
      : super(key: key);

  final VoidCallback? onPressed;

  final String firstText;
  final String lastText;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(firstText, style: const TextStyle(color: TEXT_COLOR_LIGHTER)),
            const SizedBox(width: PADDING_VERTICALLY_XXS),
            Text(lastText, style: const TextStyle(color: TEXT_COLOR_MAIN))
          ],
        ));
  }
}
