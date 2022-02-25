import 'package:e_commerce_app/modules/home/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/states.dart';
import '../item/item.dart';

class NewProductScreen extends StatelessWidget {
  const NewProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return SizedBox(
          height: 100,
          child: ListView.separated(
            physics:const BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
                item(cubit.homeModel!.data!.newProducts![index], index),
            separatorBuilder: (context, index) => const SizedBox(
              width: 15,
            ),
            itemCount: cubit.homeModel!.data!.newProducts!.length,
          ),
        );
      },
    );
  }
}
