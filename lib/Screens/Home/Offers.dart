import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/components/Category.dart';


Widget Offers(var context,double height){
  return Column(
    children: [
      SizedBox(height: 10),
      Category(context: context,height: height,title: 'Welcome Offers'),
      CarouselSlider.builder(
        itemBuilder: (context,_,b){
          return Container(height: 200,width:height*0.46,color: Color(0xff002244));
        },
        itemCount: 5,
        options: CarouselOptions(),
      ),
      SizedBox(height: 10),
      Category(context: context,height: height,title: 'Time-Limited Deals'),
      CarouselSlider.builder(
        itemBuilder: (context,_,b){
          return Container(height: 200,width:height*0.46,color: Color(0xff002244));
        },
        itemCount: 5,
        options: CarouselOptions(),
      ),
      SizedBox(height: 10),
      Category(context: context,height: height,title: 'Weekend Mania'),
      CarouselSlider.builder(
        itemBuilder: (context,_,b){
          return Container(height: 200,width:height*0.46,color: Color(0xff002244));
        },
        itemCount: 5,
        options: CarouselOptions(),
      ),
       


    ],
  );
}