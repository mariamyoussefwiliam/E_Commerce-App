import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/no%20internet/cubit/cubit.dart';
import 'package:e_commerce_app/no%20internet/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

import '../../models/onBoarding_model.dart';
import '../styles/colors.dart';
import 'constants.dart';
Widget customTextFormField({
  required TextEditingController controller,
  required String label,
  bool obSecure = false,
  IconData? prefixIcon,
  bool prefix = false,
  IconData? suffixIcon,
  bool suffix = false,
  Function? onPressed,
  required String? Function(String?) validate,
  TextInputType type = TextInputType.text,
  Function? onChanged,
}) {
  return TextFormField(
    onChanged: (value) {
      onChanged != null ? onChanged(value) : null;
    },
    // validator: (s) {
    //
    //   if (s!.trim().isEmpty) {
    //     return error;
    //   }
    //    validate(s);
    // },

    validator: (value) {
      return validate(value);
    },
    controller: controller,
    obscureText: obSecure,
    cursorColor: primaryColor,
    keyboardType: type,
    decoration: InputDecoration(
      border: InputBorder.none,
      prefixIcon: prefix
          ? Icon(
        prefixIcon,
        color: Colors.grey,
        size: 23.h,
      )
          : null,
      suffixIcon: suffix
          ? IconButton(
        icon: Icon(
          suffixIcon,
          color: Colors.grey,
          size: 23.h,
        ),
        onPressed: () {
          onPressed!();
        },
      )
          : null,
      labelText: label,
      labelStyle: TextStyle(
        color: Colors.grey[400],
        fontSize: 15.sp,
      ),
    ),
  );
}

Widget customMaterialButton({
  required Function onPressed,
  required String text,
  bool color = true,
}) =>
    Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: color ? null : Border.all(color: primaryColor, width: 2),
        gradient: color
            ? gradientColor
            : const LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white,
                ],
              ),
      ),
      child: Center(
        child: MaterialButton(
          onPressed: () {
            onPressed();
          },
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: color ? Colors.white : primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );

Widget noInternet(context) => BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/no internet.json',
                    width: MediaQuery.of(context).size.width / 1, height: 400),
                const Text(
                  'Check Internet Connection',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: 150,
                  child: customMaterialButton(
                      text: 'Retry',
                      onPressed: () {

                        LayoutCubit.get(context).checkInternetConnection();
                        if(connected==false)
                          {
                            showToast(message: "no internet connection");
                          }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );

Future<bool?> showToast({required String message, Color color = Colors.green}) {
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: color,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

void navigatorAndRemove(context, Widget widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (Route<dynamic> route) => false,
  );
}

Widget buildBoardingItem(BoardingModel model, context) => Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
            child: connected
                ? Lottie.network(model.lottie!,
                    width: MediaQuery.of(context).size.width / 1)
                : Lottie.asset('assets/no internet.json',
                    width: MediaQuery.of(context).size.width / 1)),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          model.title!,
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
      ],
    );

void navigator(context, Widget widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

Widget imageFromNetwork(
    {required String url,
      fit = BoxFit.cover,
      double height = double.infinity,
      double width = double.infinity}) {
  return CachedNetworkImage(
    imageUrl: url,
    placeholder: (context, url) =>
    const Center(child: CircularProgressIndicator()),
    errorWidget: (context, url, error) => const Image(
      image: AssetImage("assets/images/download.png"),
      width: 120,
      height: 25,
      //  fit: BoxFit,
    ),
    fit: fit,
    height: height,
    width: width,
  );
}


