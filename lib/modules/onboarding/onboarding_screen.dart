import 'package:e_commerce_app/no%20internet/no_internet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../models/onBoarding_model.dart';
import '../../shared/component/component.dart';
import '../../shared/network/local/cache_helper.dart';
import '../../shared/styles/colors.dart';
import '../authentication/login/login_screen.dart';
import '../authentication/register/register_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  bool isList = false;
  List<BoardingModel> boarding = [
    BoardingModel(
      title: 'Welcome',
      lottie: 'https://assets2.lottiefiles.com/packages/lf20_uichdspt.json',
    ),
    BoardingModel(
      title: 'Hope You Enjoy With Us',
      lottie: 'https://assets9.lottiefiles.com/packages/lf20_nve3uwej.json',
    ),
    BoardingModel(
      title: 'We always with You',
      lottie: 'https://assets5.lottiefiles.com/packages/lf20_cdkfojwo.json',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NoInternet(
        widget: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 90.h,
                  ),
                  SizedBox(
                    height: 400,
                    child: PageView.builder(
                      physics: const BouncingScrollPhysics(),
                      controller: boardController,
                      onPageChanged: (int index) {
                        if (index == boarding.length - 1) {
                          setState(() {
                            isList = true;
                          });
                        } else {
                          setState(() {
                            isList = false;
                          });
                        }
                      },
                      itemBuilder: (context, index) =>
                          buildBoardingItem(boarding[index], context),
                      itemCount: boarding.length,
                    ),
                  ),
                  // spacing
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmoothPageIndicator(
                          controller: boardController,
                          effect: ExpandingDotsEffect(
                            activeDotColor: primaryColor,
                            dotColor: Colors.grey[400]!,
                            dotHeight: 10,
                            expansionFactor: 4,
                            dotWidth: 10,
                            spacing: 8.0,
                          ),
                          count: boarding.length),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),

                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey,
                  ),
                  //const Spacer(flex: 1,),
                  SizedBox(
                    height: 50.h,
                  ),
                  customMaterialButton(
                      onPressed: () {
                        CacheHelper.put(key: "onBoarding", value: true);

                        navigatorAndRemove(context, LoginScreen());
                      },
                      text: 'Sign In'),
                  const SizedBox(
                    height: 10.0,
                  ),
                  customMaterialButton(
                    onPressed: () {
                      CacheHelper.put(key: "onBoarding", value: true);
                      navigatorAndRemove(context, RegisterScreen());
                    },
                    text: 'Sign Up',
                    color: false,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
