
import 'package:e_commerce_app/no%20internet/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(InternetStatesInitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  void checkInternetConnection() {
    emit(CheckInternetConnectionState());
  }
}
