import '../../../models/home_model.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class GetHomeLoadingState extends HomeStates {}

class GetHomeSuccessState extends HomeStates {
  final HomeModel homeModel;

  GetHomeSuccessState(this.homeModel);
}

class GetHomeErrorState extends HomeStates {
  final String error;

  GetHomeErrorState(this.error);
}
