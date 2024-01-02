import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/Screens/Hotels/AllHotels.dart';
import 'package:travel_app/Screens/Hotels/Hotels%20Details.dart';
import 'package:travel_app/Screens/Hotels/Hotelsearch.dart';
import 'package:travel_app/backend/backend.dart';
import 'package:travel_app/components/Category.dart';
import 'package:travel_app/components/TextStyles.dart';
import 'package:velocity_x/velocity_x.dart';
class Restaurants extends StatefulWidget {
  const Restaurants({Key? key}) : super(key: key);

  @override
  State<Restaurants> createState() => _RestaurantsState();
}

class _RestaurantsState extends State<Restaurants> {
  @override
  var h,w;
  @override
  Widget build(BuildContext context) {
    h=MediaQuery.of(context).size.height;
    w=MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff4c2c2),

        body: SingleChildScrollView(

          child: Column(
            children: [
              VxArc(
                height: h*0.04,
                child: Container(
                    padding: EdgeInsets.only(bottom: 40),
                    height: h*0.18,
                    width: double.infinity,
                    color: Colors.orange.shade900,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.arrow_back,size:w*0.065,color: Colors.white,)),
                            IconButton(
                                onPressed: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=>HotelSearch()));
                                },
                                icon: Icon(Icons.search,size: w*0.065,color: Colors.white,))
                          ],
                        ),
                        Text('Great Hotels\nfor Great Peoples',
                          style: title(size: h*0.03,bold: true),
                          textAlign: TextAlign.center,)
                      ],
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10,vertical: 10
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Select City',style: Style1(size: w*0.04),),
                        ButtonBar(
                          children: [
                            SvgPicture.asset('assets/images/location.svg',width: 19,height: 19,color: Colors.blue.shade700,),

                            Text('Jaipur',style: Style1(size: w*0.035),),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    BuildHotels(getRestaurants1(),'Dining For You'),
                    SizedBox(height: 10),
                    BuildHotels(getRestaurants2(),'Trending',),
                    SizedBox(height: 10),
                    BuildHotels(getRestaurants3(),'Five Star Dinings'),
                    SizedBox(height: 10,),
                    Center(
                        child:Text(
                          'Can\'t find what you are looking for?\nTry Search!',
                          style: Style1(color: Colors.grey.shade700,bold: true,size:w*0.05
                          ),
                          textAlign: TextAlign.center,
                        )
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget BuildHotels(Future func,String string){
    return FutureBuilder(
        future: func,
        builder: (context,AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            var data=snapshot.data;
            return Column(
              children: [
                Category(context: context,title: string, height: h,onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AllHotels(data: data,cat: string,)));
                }),
                SizedBox(height: 10,),
                CarouselSlider.builder(
                    itemCount: 5,
                    itemBuilder:(context,index,b){
                      return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: InkWell(
                              onTap: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context)=>HotelsDetail(data: data[index],cat: string,)));
                              },
                              child: HotelContainer(data[index],string))
                      );
                    }, options:CarouselOptions(
                  viewportFraction: 1,
                  aspectRatio: 16/12,
                  autoPlay: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 600),
                  enableInfiniteScroll: false,
                  scrollPhysics: BouncingScrollPhysics(),
                )
                ),
              ],
            );
          }
          else{
            return Container(height: w*0.75,color: Colors.grey);
          }
        }
    );
  }
  Widget HotelContainer(var data,var string){
    return  Container(
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            height: h/5,
            width: double.infinity,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Hero(
                  tag: '$string ${data['location_id']}',
                  child: CachedNetworkImage(
                    imageUrl: data['photo']['images']['original']['url'],
                    fit: BoxFit.fitWidth,
                  ),
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data['name'],style: title(size: w*0.04,color: Colors.black,bold: true),maxLines: 1,),
                SizedBox(height: 5),
                Text(data['location_string'],style: Style1(size: w*0.032,color: Colors.black),),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('    ${data['rating']} ⭐',style: Style1(size:w*0.03),),
                    Text('${data['price']}',style: Style1(size: w*0.03,bold: true,color: Colors.black),)
                  ],
                )
              ],
            ),
          ),

        ],
      ),
    );
  }

}
