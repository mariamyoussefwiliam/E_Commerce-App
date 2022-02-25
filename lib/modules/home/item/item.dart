import 'package:flutter/material.dart';
import '../../../shared/styles/colors.dart';

Widget item(model, index,{category=false}) {
  return Container(
    width: 150,
    decoration: BoxDecoration(
      border: Border.all(
        width: 2,
        color: Colors.grey.shade300,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(10.0),
      ),
    ),
    child: Container(
      margin: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              model.name!,
              style: const TextStyle(
                fontSize: 18,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            !category?Text(
              "${model.price}",
              style: const TextStyle(color: secondaryColor),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ):Container(),
          ],
        ),
      ),
    ),
  );
}
