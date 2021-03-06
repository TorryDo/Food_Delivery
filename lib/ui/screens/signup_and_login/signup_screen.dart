import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/ui/screens/signup_and_login/signup_bloc.dart';
import 'package:food_delivery/ui/screens/signup_and_login/signup_event.dart';
import 'package:food_delivery/ui/screens/signup_and_login/signup_state.dart';
import 'package:food_delivery/ui/widgets/appbar_welcome.dart';
import 'package:food_delivery/ui/widgets/button/group_buttons/three_buttons.dart';
import 'package:food_delivery/ui/widgets/text/group_text/title_and_description.dart';
import 'package:food_delivery/ui/widgets/text_field/textfield_with_label.dart';
import 'package:food_delivery/utils/res/dimens.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  final CREATE_AN_ACCOUNT = 'Create an account';
  final CREATE_ACCOUNT_DESCRIPTION =
      'Welcome firend, enter your details so lets get started in ordering food.';

  final _EMAIL_LABEL = 'Email Address';
  final _EMAIL_HINT = 'eg: jamesbond123@gmail.com';

  final _PASSWORD_LABEL = 'Password';
  final _PASSWORD_HINT = 'Enter password';

  final _PADDING_VERTICALLY = PADDING_VERTICALLY;
  final _PADDING_HORIZONTALLY = PADDING_HORIZONTALLY_XL;

  @override
  Widget build(BuildContext context) {
    return _signUpScreen();
  }

  _signUpScreen() {
    return Material(
      child: SafeArea(
        child: Column(
          children: [

            _topAppBar(),
            _titleAndDescription(),
            _form(),
            _bottomButtons()

          ],
        ),
      ),
    );
  }

  _topAppBar() => AppbarWelcome(
        leftButtonCLick: _leftButtonClick,
      );

  void _leftButtonClick() {
    log('clicked at signup screen');
    Get.back();
  }

  _titleAndDescription() {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: _PADDING_VERTICALLY),
        child: TitleAndDescription(
            title: CREATE_AN_ACCOUNT, description: CREATE_ACCOUNT_DESCRIPTION));
  }

  _form() {
    return Flexible(
        flex: 5,
        child: Container(
            // color: Colors.redAccent,
            margin: EdgeInsets.symmetric(
                horizontal: _PADDING_HORIZONTALLY,
                vertical: _PADDING_VERTICALLY),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _emailTextField(),
                _passwordTextField(),
                const SizedBox(height: PADDING_VERTICALLY_XL),
                const SizedBox(height: PADDING_VERTICALLY_XL)
              ],
            )));
  }

  _emailTextField() {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      return TextFieldWithLabel(
        label: _EMAIL_LABEL,
        hint: _EMAIL_HINT,
        onChanged: (notNullString) =>
            context.read<SignUpBloc>().add(SignUpEmailChanged(notNullString)),
        // validator: (nullableString) =>
        // state.isEmailValid ? null : 'email isnt valid',
      );
    });
  }

  _passwordTextField() {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      return TextFieldWithLabel(
        label: _PASSWORD_LABEL,
        hint: _PASSWORD_HINT,
        isObscured: true,
        onChanged: (notNullString) => context
            .read<SignUpBloc>()
            .add(SignUpPasswordChanged(notNullString)),
        // validator: (nullableString) =>
        // state.isPasswordValid ? null : 'password isnt valid',
      );
    });
  }

  _bottomButtons() {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      return Flexible(
          flex: 3,
          child: ThreeButtons(buttonOrangeClicked: () {
            if (state.isPasswordValid && state.isEmailValid) {
              context.read<SignUpBloc>().add(SignUpSubmitted());
            } else {
              log('email or password not valid');
            }
          }));
    });
  }
}
