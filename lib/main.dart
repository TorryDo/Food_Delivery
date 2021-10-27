import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/ui/screens/signup_and_login/auth/auth_repository.dart';
import 'package:food_delivery/ui/screens/signup_and_login/signup_bloc.dart';
import 'package:food_delivery/ui/screens/signup_and_login/signup_screen.dart';
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
      theme:
          ThemeData(primarySwatch: Colors.blue, backgroundColor: THEME_COLOR),
      home: _appWithMultiRepo(),
    );
  }

  _appWithMultiRepo() {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(create: (_) => AuthRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SignUpBloc>(
              create: (context) =>
                  SignUpBloc(authRepo: context.read<AuthRepository>())),
        ],
        child: const SignUpScreen(),
      ),
    );
  }
}
