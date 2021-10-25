import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/ui/widgets/appbar_welcome.dart';
import 'package:food_delivery/ui/widgets/textfield_with_label.dart';
import 'package:food_delivery/ui/widgets/three_buttons.dart';
import 'package:food_delivery/ui/widgets/title_and_description.dart';
import 'package:food_delivery/utils/res/dimens.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  final CREATE_AN_ACCOUNT = 'Create an account';
  final CREATE_ACCOUNT_DESCRIPTION =
      'Welcome firend, enter your details so lets get started in ordering food.';

  final _EMAIL_LABEL = 'Email Address';
  final _EMAIL_HINT = 'eg: jamesbond123@gmail.com';

  final _PASSWORD_LABEL = 'Password';
  final _PASSWORD_HINT = 'Enter password';

  final _CONFIRM_PASSWORD_LABEL = 'Confirm Password';
  final _CONFIRM_PASSWORD_HINT = 'Confirm password';

  final _PADDING_VERTICALLY = 20.0;
  final _PADDING_HORIZONTALLY = 30.0;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            const AppbarWelcome(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: _PADDING_VERTICALLY),
              child: TitleAndDescription(
                  title: CREATE_AN_ACCOUNT,
                  description: CREATE_ACCOUNT_DESCRIPTION),
            ),
            Flexible(
                flex: 5,
                child: Container(
                    // color: Colors.redAccent,
                    margin: EdgeInsets.symmetric(
                        horizontal: _PADDING_HORIZONTALLY,
                        vertical: _PADDING_VERTICALLY),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFieldWithLabel(
                            label: _EMAIL_LABEL, hint: _EMAIL_HINT),
                        TextFieldWithLabel(
                            label: _PASSWORD_LABEL,
                            hint: _PASSWORD_HINT,
                            isObscured: true),
                        TextFieldWithLabel(
                            label: _CONFIRM_PASSWORD_LABEL,
                            hint: _CONFIRM_PASSWORD_HINT,
                            isObscured: true),
                        const SizedBox(height: PADDING_VERTICALLY_XXL)
                      ],
                    ))),
            const Flexible(
                flex: 3,
                child: ThreeButtons()
            )
          ],
        ),
      ),
    );
  }
}
