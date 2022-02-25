import 'package:e_commerce_app/modules/home/home_screen.dart';
import 'package:e_commerce_app/no%20internet/no_internet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/component/component.dart';
import '../../../shared/component/constants.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../../../shared/styles/colors.dart';
import '../register/register_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return NoInternet(
      widget: Scaffold(
        backgroundColor: Colors.white,
        body: BlocProvider(
          create: (BuildContext context) => LoginCubit(),
          child: BlocConsumer<LoginCubit, LoginStates>(
            listener: (context, state) {
              if (state is LoginSuccessState) {
                if (state.userModel.success!) {
                  CacheHelper.put(key: "token", value: state.userModel.data!.token);
                  userToken = CacheHelper.get(key: "token");
                  CacheHelper.put(key: "name", value: state.userModel.data!.user!.name!.split(' ')[0]);
                  userName = CacheHelper.get(key: "name");
                  navigatorAndRemove(
                    context,
                    const HomeScreen(),
                  );
                } else {
                  showToast(
                      message: "${state.userModel.message}", color: Colors.red);
                }
              } else if (state is LoginErrorState) {

                showToast(message: state.error, color: Colors.red);
              }
            },
            builder: (context, state) {
              var cubit = LoginCubit.get(context);
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 350.h,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/images/background-Recovered.png',
                            ),
                            fit: BoxFit.fill),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            left: 18.w,
                            width: 70.w,
                            height: 200.h,
                            child: Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/light-1.png'),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 90.w,
                            width: 80.w,
                            height: 150.h,
                            child: Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/light-2.png'),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 30.w,
                            top: 30.h,
                            width: 80.w,
                            height: 140.h,
                            child: Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/clock.png'),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            child: Container(
                              margin: EdgeInsets.only(top: 50.h),
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30.0.w),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(5.w),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.r),
                              boxShadow: [
                                BoxShadow(
                                  color: shadowColor,
                                  blurRadius: 20.0.r,
                                  offset: Offset(0.w, 10.h),
                                ),
                              ],
                            ),
                            child: Form(
                              key: formKey,
                              child: Column(
                                children: <Widget>[
                                  customTextFormField(
                                    onChanged: (email) {
                                      cubit.onEmailChanged(email);
                                    },
                                    controller: emailController,
                                    //error: "Email Must Be Not Empty",
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return 'Email Must Be Not Empty ';
                                      } else if (!cubit.hasEmailValid) {
                                        return 'please, Enter a valid email!';
                                      }
                                      return null;
                                    },
                                    label: "Enter your Email",
                                    type: TextInputType.emailAddress,
                                  ),
                                  customTextFormField(
                                    onChanged: (password) {
                                      cubit.onPasswordChanged(password);
                                    },
                                    controller: passwordController,
                                    //error: "Password Must Be Not Empty",
                                    label: "Password",
                                    type: TextInputType.text,
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return 'Password Must Be Not Empty';
                                      } else if (!cubit.hasPasswordNumber) {
                                        return 'Please, Enter A valid Password';
                                      } else if (!cubit.isPasswordCharacters) {
                                        return 'please, Enter a 6 characters';
                                      }
                                      return null;
                                    },
                                    obSecure: cubit.eye ? true : false,
                                    suffix: true,
                                    suffixIcon: cubit.eye
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    onPressed: () {
                                      cubit.changeEye();
                                    },
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          customMaterialButton(
                              text: 'Login',
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  //print(emailController.text);
                                  //print(passwordController.text);
                                  cubit.userLogin(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                  //CacheHelper.put(key: "token", value:cubit.model!.token);
                                  //   navigatorAndRemove(
                                  //       context, ZoomDrawerScreen());
                                  // }
                                }
                              }),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't hava an account ?",
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              TextButton(
                                onPressed: () {
                                  navigatorAndRemove(
                                    context,
                                    RegisterScreen(),
                                  );
                                },
                                child: const Text(
                                  "Register",
                                  style: TextStyle(
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
      
      
  }
}
