import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/Screens/Attractions/Attractions.dart';
import 'package:travel_app/Screens/Home/Offers.dart';
import 'package:travel_app/Screens/Hotels/Hotels.dart';
import 'package:travel_app/Screens/Restaurants/Restaurant.dart';
import 'package:travel_app/backend/list.dart';
import 'package:travel_app/components/TextStyles.dart';
import 'package:velocity_x/velocity_x.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currindex=0;

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var list=[
      Offers(context, height),
      Hotels(),
      Attractions(),
      Restaurants()
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade50,
          body: SingleChildScrollView(
            child: Column(
              children: [
                VxArc(
                  height:height*0.04,
                  child:Container(
                    height: height*0.17,
                    color:  const Color(0xff0000ff),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15,left: 15,right: 15,bottom: 30),
                      child: Center(child: topBar(height)),
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                   
                        const SizedBox(height: 10),
                        SizedBox(
                          height: height*0.13,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: name.length,
                           scrollDirection: Axis.horizontal,
                           itemBuilder: (context,index){
                            return InkWell(
                                onTap: (){
                                  if(index!=0){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => list[index]));
                                    }
                                  },child: type(
                                top:img[index],
                                bottom: name[index],
                                selected:currindex==index,
                            ));
                          }),
                        ),
                        list[0]
                      ]
                ),
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
  Widget topBar(double height){
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: 200,
              child: Text('Welcome to Travelयात्री', style: Style1(
                size: height * 0.033, bold: true, color: Colors.white,),
              )
          ),
          Container(
            height: height * 0.4,
            width: 60,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff0f004F)
            ),
            child: Center(
                child: SvgPicture.asset(
                  'assets/images/search.svg', color: Colors.white, width: 20,)
            ),
          )
        ]
    );
  }
  Widget type({required Widget top, var bottom, bool selected=false}){
    return Container(
      margin: EdgeInsets.only(right: 12),
      width: 90,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: selected?const Color(0xff0000ff):Colors.transparent,

          border: Border.all(
              color: Colors.black38
          )
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            top,
            const SizedBox(height: 10),
            bottom!=''?Text(
              bottom,
              style: Style1(
                  size: 12, color: selected ? Colors.white : Colors.black),
            ):Container(),

          ],
        ),
      ),

    );
  }

}
