import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:e_commerce_app/modules/authentication/login/login_screen.dart';
import 'package:e_commerce_app/modules/home/home_screen.dart';
import 'package:e_commerce_app/no%20internet/no_internet.dart';
import 'package:flutter/material.dart';

import '../../shared/component/constants.dart';
import '../../shared/network/local/cache_helper.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    userToken = CacheHelper.get(key: "token");
    return AnimatedSplashScreen(
      splash: const Image(
        image: AssetImage("assets/images/logo.gif"),
       fit: BoxFit.cover,
        width: 250,
        height: 250,
        //  fit: BoxFit,
      ),
      nextScreen: userToken == null
          ? LoginScreen()
          : const NoInternet(
              widget: HomeScreen(),
            ),
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.white,
    );
  }
}
