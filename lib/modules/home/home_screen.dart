import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce_app/modules/home/cubit/states.dart';
import 'package:e_commerce_app/modules/home/most%20seller/most_seller.dart';
import 'package:e_commerce_app/modules/home/new%20product/new_product.dart';
import 'package:e_commerce_app/modules/home/search/search.dart';
import 'package:e_commerce_app/no%20internet/no_internet.dart';
import 'package:e_commerce_app/shared/component/component.dart';
import 'package:e_commerce_app/shared/component/constants.dart';
import 'package:e_commerce_app/shared/network/local/cache_helper.dart';
import 'package:e_commerce_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../authentication/login/login_screen.dart';
import 'cubit/cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  NoInternet(
      widget: BlocProvider(
        create: (context) => HomeCubit()..getHomeData(),
        child: BlocConsumer<HomeCubit, HomeStates>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = HomeCubit.get(context);
           return  ConditionalBuilder(
                  condition: cubit.homeModel != null,
                  builder: (context) {
                    return Container(
                      padding: const EdgeInsets.all(20.0),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: SizedBox(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(top: 15.0),
                                      child: Row(
                                        children: [
                                          Text("Hi , $userName ",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: primaryColor,
                                                  fontSize: 28.0)),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Image.asset(
                                            'assets/images/hand.png',
                                            width: 36,
                                            height: 36,
                                          )
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      padding: const EdgeInsets.all(1.0),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                      ),
                                      child: PopupMenuButton(
                                        icon: const Icon(
                                          Icons.logout,
                                          size: 22,
                                        ),
                                        offset: const Offset(-25, 60),
                                        itemBuilder: (context) => [
                                          PopupMenuItem<int>(
                                            child: InkWell(
                                              onTap: () {
                                                CacheHelper.removeData(key: "token");
                                                CacheHelper.removeData(key: "name");
                                                navigatorAndRemove(
                                                    context, LoginScreen());
                                              },
                                              child: const Center(
                                                child: Text("LogOut"),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const SearchScreen(),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 2,
                                        color: Colors.grey
                                            .shade300, // red as border color
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                    ),
                                    child: Container(
                                      margin: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: imageFromNetwork(
                                            url:cubit.homeModel!.data!.sliders![0].imageWithBase!),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 2,
                                        color: Colors.grey
                                            .shade300, // red as border color
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                    ),
                                    child: Container(
                                      margin: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children:  [
                                            Text(
                                              cubit.homeModel!.data!.categories![0].name!,
                                              style: const TextStyle(
                                                fontSize: 18,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 25),
                            const Text(
                              'Most Seller',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 25),
                            const MostSellerScreen(),
                            const SizedBox(height: 25),
                            const Text(
                              ' New Products',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 25),
                            const NewProductScreen(),
                          ],
                        ),
                      ),
                    );
                  },
                  fallback: (context) =>
                      const Center(child: CircularProgressIndicator()),
                );

            }),
      ),
    ));
  }
}
