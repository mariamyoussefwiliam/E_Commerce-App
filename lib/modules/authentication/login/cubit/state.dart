import 'package:e_commerce_app/models/user_model.dart';

abstract class LoginStates {}

class InitLoginState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final UserModel userModel;

  LoginSuccessState(this.userModel);
}

class LoginErrorState extends LoginStates {
  final String error;

  LoginErrorState(this.error);
}

class LogOutState extends LoginStates {}

class ChangeEyeState extends LoginStates {}

class ChangeLoginState extends LoginStates {}

class ChangeForgetPasswordState extends LoginStates {}

class ChangeEmailValidateState extends LoginStates {}

class ChangePasswordValidateState extends LoginStates {}
