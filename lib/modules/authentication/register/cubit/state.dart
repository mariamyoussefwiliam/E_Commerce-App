

import 'package:e_commerce_app/models/user_model.dart';
abstract class RegisterStates {}

class InitRegisterState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  final UserModel registerModel;

  RegisterSuccessState(this.registerModel);
}

class RegisterErrorState extends RegisterStates {
  final  error;

  RegisterErrorState(this.error);
}


class ChangeEyeState extends RegisterStates{}

class ChangeRegisterState extends RegisterStates{}
class ChangeForgetPasswordState extends RegisterStates{}