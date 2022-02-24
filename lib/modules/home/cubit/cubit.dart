import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/models/home_model.dart';
import 'package:e_commerce_app/modules/home/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/network/end_points.dart';
import '../../../shared/network/remote/dio-helper.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  HomeModel? homeModel;

  void getHomeData() {
    emit(GetHomeLoadingState());
    DioHelper.getData(url: home).then((value) {
      homeModel =HomeModel.fromJson(value.data);
      print(value.data);
      emit(GetHomeSuccessState(homeModel!));
    }).catchError((error) {
      print(error.toString());
      emit(GetHomeErrorState(error.toString()));

    });
  }
}
