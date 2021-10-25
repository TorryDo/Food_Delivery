import 'package:flutter/material.dart';
import 'package:food_delivery/ui/screens/signup_and_login/create_account_screen.dart';
import 'package:food_delivery/utils/res/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: THEME_COLOR
      ),
      home: const CreateAccountScreen(),
    );
  }
}
