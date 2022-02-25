import 'package:e_commerce_app/modules/home/cubit/cubit.dart';
import 'package:e_commerce_app/modules/home/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../item/item.dart';

class MostSellerScreen extends StatelessWidget {
  const MostSellerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context,state){},
      builder:(context,state){
        var cubit=HomeCubit.get(context);
        return SizedBox(
          height: 100,
          child: ListView.separated(
            physics:const BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => item(cubit.homeModel!.data!.mostSeller![index],index),
            separatorBuilder: (context, index) =>
            const SizedBox(
              width: 15,
            ),
            itemCount: cubit.homeModel!.data!.mostSeller!.length,
          ),
        );
      },
    );
  }
}
