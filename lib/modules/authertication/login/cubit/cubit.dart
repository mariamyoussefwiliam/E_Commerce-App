import 'package:e_commerce_app/models/register_model.dart';
import 'package:e_commerce_app/modules/authertication/login/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/network/end_points.dart';
import '../../../../shared/network/remote/dio-helper.dart';
class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitLoginState());

  static LoginCubit get(context) => BlocProvider.of(context);

  UserModel? userModel;

  bool eye = true;
  bool confirmEye = true;




  void userLogin({required String email, required String password}) {
    emit(LoginLoadingState());
    DioHelper.postData(url: login, data: {
      'email': email,
      'password': password,
      'type': 'login',
    }).then((value) {
      userModel = UserModel.fromJson(value.data);
      print(value.data);
      emit(LoginSuccessState(userModel!));
    }).catchError((onError) {
      print(onError.toString());
      emit(LoginErrorState(onError.response!.data['message'].toString()));
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


  bool forgetPassword=false;
  void changeForgetPassword()
  {
    forgetPassword=!forgetPassword;
    emit(ChangeForgetPasswordState());
  }

  bool isPasswordCharacters = false;
  bool hasPasswordNumber = false;
  bool hasEmailValid = false;


  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');
      isPasswordCharacters = false;
      if (password.length >= 8) {
        isPasswordCharacters = true;
      }
      hasPasswordNumber = false;
      if (numericRegex.hasMatch(password)) {
        hasPasswordNumber = true;
      }
  }

  onEmailChanged(String email)
  {
    final emailValid =RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
      hasEmailValid =false;
      if(emailValid.hasMatch(email)){
        hasEmailValid = true;
      }

  }



}
