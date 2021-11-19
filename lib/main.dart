import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/data/food_api/food_api_adapter.dart';
import 'package:food_delivery/data/food_api/food_repository.dart';
import 'package:food_delivery/ui/screens/food_detail/food_detail_screen.dart';
import 'package:food_delivery/ui/screens/home/home_screen.dart';
import 'package:food_delivery/ui/screens/shopping_cart/shopping_cart_screen.dart';
import 'package:food_delivery/ui/screens/signup_and_login/signup_bloc.dart';
import 'package:food_delivery/ui/screens/signup_and_login/signup_screen.dart';
import 'package:food_delivery/ui/screens/welcome_screen/first_launch_screen.dart';
import 'package:food_delivery/ui/screens/welcome_screen/logo_screen.dart';
import 'package:food_delivery/utils/res/colors.dart';
import 'package:food_delivery/utils/route_keys.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart'
    as getTrans;

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

  _appWithMultiRepositoryProvider() => MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AuthRepository>(create: (_) => AuthRepository()),
          RepositoryProvider<FoodRepository>(
              create: (_) => FoodRepository(FoodApiAdapterImpl())),
        ],
        child: _appWithMultiBlocProvider(),
      );

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
      defaultTransition: getTrans.Transition.fade,
      getPages: [
        GetPage(name: WELCOME_SCREEN_KEY, page: () => const LogoScreen()),
        GetPage(name: SPLASH_SCREEN_KEY, page: () => const FirstLaunchScreen()),
        GetPage(name: SIGNUP_SCREEN_KEY, page: () => const SignUpScreen()),
        GetPage(name: HOME_SCREEN_KEY, page: () => HomeScreen()),
        GetPage(name: FOOD_DETAIL_SCREEN_KEY, page: () => FoodDetailScreen()),
        GetPage(name: SHOPPING_CART_SCREEN_KEY, page: () => ShoppingCartScreen()),
      ],
    );
  }
}
