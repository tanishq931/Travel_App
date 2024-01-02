import 'package:flutter/material.dart';
import 'package:travel_app/components/TextStyles.dart';

Widget Category({
  double height =100,
 required BuildContext context,
  String title='',
  VoidCallback? onTap
}){
  return  Row(
    mainAxisAlignment:  MainAxisAlignment.spaceBetween,
    children: [
      Text(title,style: Style1(size:  height*0.027,bold: true)),
      InkWell(
        onTap: onTap,
        child: Text(
          'See all',
          style: Style1(
              color: Colors.yellow.shade900,
              size: 14),),
      ),
    ],
  );
}