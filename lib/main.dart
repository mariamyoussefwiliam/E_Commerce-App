import 'package:e_commerce_app/no%20internet/cubit/cubit.dart';
import 'package:e_commerce_app/shared/network/local/cache_helper.dart';
import 'package:e_commerce_app/shared/network/remote/dio-helper.dart';
import 'package:e_commerce_app/shared/observer.dart';
import 'package:e_commerce_app/shared/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'modules/onboarding/onboarding_screen.dart';
import 'modules/splash/splash_screen.dart';
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);


  await DioHelper.init();
  await CacheHelper.init();
  bool? onBoarding = CacheHelper.get(key: "onBoarding");

  Widget widget;
  if (onBoarding == null || onBoarding == false) {
    widget =const  OnBoardingScreen();
  } else {
    widget =const  SplashScreen();
  }
  BlocOverrides.runZoned(
        () {
      runApp(MyApp(widget));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final Widget widget;

  const MyApp(this.widget, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LayoutCubit()),

      ],

      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: () =>
            MaterialApp(
              builder: (context, widget) {
                ScreenUtil.setContext(context);
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: widget!,
                );
              },
              debugShowCheckedModeBanner: false,
              theme: lightTheme(context),
              themeMode: ThemeMode.light,
              home: widget,
            ),
      ),
    );
  }
}