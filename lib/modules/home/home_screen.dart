import 'package:e_commerce_app/modules/home/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>HomeCubit()..getHomeData(),
      child: BlocConsumer<HomeCubit,HomeStates>(
        listener: (context,state){},
        builder:(context,state)
          {
            var cubit =HomeCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: const Text("hello"),
                actions: [
                  const  Text("Logout",style: TextStyle(fontSize: 20),),
                  IconButton(
                    onPressed: () {},
                    icon:const  Icon(Icons.logout,color: Colors.white,),
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
}
