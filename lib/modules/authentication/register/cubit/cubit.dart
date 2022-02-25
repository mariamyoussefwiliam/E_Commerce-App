import 'package:e_commerce_app/models/user_model.dart';
import 'package:e_commerce_app/modules/authentication/register/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/network/end_points.dart';
import '../../../../shared/network/remote/dio-helper.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(InitRegisterState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  UserModel? registerModel;

  bool eye = true;
  bool confirmEye = true;

  int loginStatus = 0;
  Map<String, dynamic>? test;
  String error = "";

  void userRegister({
    required String userName,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(url: register, data: {
      'name': userName,
      'email': email,
      'password': password,
      'phone': phone,
      "role": "3",
    }).then((value) {
      //  print(value.data);
      registerModel = UserModel.fromJson(value.data);
      emit(RegisterSuccessState(registerModel!));
    }).catchError((onError) {
      error = onError.response.data['message'];

      emit(RegisterErrorState(error));
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
  bool hasEmailValid = false;
  bool hasName = false;

  onNameChanged(String name) {
    hasName = false;
    if (name.length > 2) {
      hasName = true;
    }
  }

  onPasswordChanged(String password) {
    //  final numericRegex = RegExp(r'[0-9]');
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

  //
  bool hasPhonedNumber = false;

  onPhoneChange(String phone) {
    hasPhonedNumber = false;
    if (phone.length >= 11) {
      hasPhonedNumber = true;
    }
  }
}
