import 'package:e_commerce_app/models/user_model.dart';
import 'package:e_commerce_app/modules/authentication/login/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/network/end_points.dart';
import '../../../../shared/network/remote/dio-helper.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitLoginState());

  static LoginCubit get(context) => BlocProvider.of(context);

  UserModel? userModel;

  bool eye = true;
  bool confirmEye = true;
  String? error;

  void userLogin({required String email, required String password}) {
    emit(LoginLoadingState());
    DioHelper.postData(url: login, data: {
      'email': email,
      'password': password,
      'type': 'login',
    }).then((value) {
      userModel = UserModel.fromJson(value.data);
      emit(LoginSuccessState(userModel!));
    }).catchError((onError) {
      print(onError.toString());
      error = onError.response!.data['message'].toString();
      emit(LoginErrorState(error.toString()));
    });
  }

  void changeEye() {
    eye = !eye;
    emit(ChangeEyeState());
  }

  void changeConfirmEye() {
    confirmEye = !confirmEye;
    emit(ChangeEyeState());
  }

  bool forgetPassword = false;

  void changeForgetPassword() {
    forgetPassword = !forgetPassword;
    emit(ChangeForgetPasswordState());
  }

  bool isPasswordCharacters = false;
  bool hasPasswordNumber = false;
  bool hasEmailValid = false;

  onPasswordChanged(String password) {
    isPasswordCharacters = false;
    if (password.length >= 6) {
      isPasswordCharacters = true;
    }

  }

  onEmailChanged(String email) {
    final emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    hasEmailValid = false;
    if (emailValid.hasMatch(email)) {
      hasEmailValid = true;
    }
  }
}
