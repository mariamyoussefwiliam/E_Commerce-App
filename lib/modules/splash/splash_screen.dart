import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:e_commerce_app/layout/layout.dart';
import 'package:e_commerce_app/modules/home/home_screen.dart';
import 'package:flutter/material.dart';

import '../../shared/component/constants.dart';
import '../../shared/network/local/cache_helper.dart';
import '../authertication/login/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    userToken = CacheHelper.get(key: "token");
    return AnimatedSplashScreen(
      splash: const Image(
        image: AssetImage("assets/images/logo.png"),
        width: 120,
        height: 25,
      //  fit: BoxFit,
      ),
      nextScreen: userToken == null
          ? LoginScreen()
          : const Layout(
              widget: HomeScreen(),
            ),
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.white,
    );
  }
}
