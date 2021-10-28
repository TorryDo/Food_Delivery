import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/ui/screens/signup_and_login/signup_bloc.dart';
import 'package:food_delivery/ui/screens/signup_and_login/signup_screen.dart';
import 'package:food_delivery/ui/screens/welcome_screen/first_launch_screen.dart';
import 'package:food_delivery/ui/screens/welcome_screen/logo_screen.dart';
import 'package:food_delivery/utils/route_keys.dart';
import 'package:food_delivery/utils/res/colors.dart';
import 'package:get/get.dart';

import 'data/auth/auth_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return _appWithMultiRepositoryProvider();
  }

  _appWithMultiRepositoryProvider() {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(create: (_) => AuthRepository()),
      ],
      child: _appWithMultiBlocProvider(),
    );
  }

  _appWithMultiBlocProvider() => MultiBlocProvider(
        providers: [
          BlocProvider<SignUpBloc>(
              create: (context) =>
                  SignUpBloc(authRepo: context.read<AuthRepository>())),
        ],
        child: _app(),
      );

  _app() {
    return GetMaterialApp(
      theme:
          ThemeData(primarySwatch: Colors.blue, backgroundColor: THEME_COLOR),
      home: const FirstLaunchScreen(),
      getPages: [
        GetPage(name: WELCOME_SCREEN_KEY, page: () => const LogoScreen()),
        GetPage(name: SPLASH_SCREEN_KEY, page: () => const FirstLaunchScreen()),
        GetPage(name: SIGNUP_SCREEN_KEY, page: () => const SignUpScreen()),
      ],
    );
  }
}
