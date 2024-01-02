
import 'package:flutter/material.dart';
import 'package:travel_app/components/TextStyles.dart';

Widget hotels({double height=100}){
  return Stack(
      children:[
        SizedBox(

          child: Container(width: height*0.18,decoration: BoxDecoration(
              color: const Color(0xff330063),
            borderRadius: BorderRadius.circular(16)
          ),),

        ),
        Positioned(
             left: 8,
            bottom: 15,
            child: RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'Rs.50k/',style:Style1(bold: true,color: Colors.white,size: 12)),
                      TextSpan(
                          text: 'night',style: Style1(color: Colors.white,size: 12)
                      )
                    ]
                )
            )),
        const Positioned(
            left: 6,
            bottom: 35,
            child: Row(
              children: [
                Icon(Icons.location_on_outlined,size: 15,color: Colors.white,),
                SizedBox(width: 3),
                Text('Jaipur',style: TextStyle(color: Colors.white,fontSize: 13),)
              ],
            )),
        Positioned( bottom: 52,
            left: 10,
            child: Text('Fairmount',style: Style1(color: Colors.white,bold: true,size: 14),)),
       const  Positioned(
         bottom: 18,
            right: 12,
            child: Text('⭐ 4.9',style: TextStyle(color: Colors.white,fontSize: 10),
        ))



      ]
  );
}
Widget buildHotels({double height=100}){
  return  SizedBox(
    height: height*0.25,
    child: ListView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: List.generate(5, (index){
        return Padding(
            padding: EdgeInsets.only(right: 13),
            child:hotels(height: height));
      }).toList(),
    ),
  );

}