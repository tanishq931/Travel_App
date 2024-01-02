import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/components/TextStyles.dart';
import 'package:url_launcher/url_launcher_string.dart';
class HotelsDetail extends StatefulWidget {
  var data;
  var cat;
  HotelsDetail({Key? key,this.data,this.cat}) : super(key: key);

  @override
  State<HotelsDetail> createState() => _HotelsDetailState();
}

class _HotelsDetailState extends State<HotelsDetail> {
  var h;
  var w;
  var data;
  var photos=[
    'small',
    'original',
    'large',
    'medium',
  ];
  @override
  Widget build(BuildContext context){
    data=widget.data;
    h=MediaQuery.of(context).size.height;
    w=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xfff4c2c2),
        title: Text('Hotels',style: title(color: Colors.black),),
        centerTitle: true,
      ),
      backgroundColor: Color(0xfff4c2c2),
      bottomNavigationBar: Container(
        height:h*0.07,
          child: Row(
            children: [
              Container(
                width: w/2,
                color: Colors.white,
                child: Center(
                  child: Text(data['price'],
                    style: title(color:Colors.black,bold: true,size: w*0.04),),
                ),
              ),
              InkWell(
                onTap: (){
                    launchUrlString('https://www.tripadvisor.in/');
                },
                child: Container(
                  width: w/2,
                  color: Colors.blue.shade600,
                  child: Center(
                    child:  Text(
                      'Book Now',style: title(color: Colors.white,bold: true),
                  ),
                ),

        ),
              ),
            ],
          ),
      ),
      body: Stack(
        children: [
          SizedBox(height: h),
          Hero(
            tag: '${widget.cat} ${data['location_id']}',
            child: SizedBox(
                height: h/3,
              width: w,
              child: CachedNetworkImage(
                imageUrl: data['photo']['images']['original']['url'],
                fit: BoxFit.cover,
              )
            ),
          ),
          Positioned(
            top: h*0.28,
            bottom: 0,
              child: Container(
                width: w,
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(24),topLeft: Radius.circular(24)),
                  color: Color(0xfff4c2c2)
                ),
                child: Desc(),
              )
          )
        ],
      ),
    );
  }
  Widget Desc(){
    int a = double.parse(data['hotel_class']).round();
    a=a==0?3:a;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data['name'],style: title(bold: true,size: w*0.045,),),
            SizedBox(height: 8,),
            Text(data['ranking'],style: Style1(size:w*0.03,bold: true),),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Prop('Ratings :', '  ${data['rating']} ⭐'),
                Row(
                  children: [
                  Text(data['num_reviews'],style: Style1(size: w*0.03),),
                  SizedBox(width: 5),
                  Icon(Icons.message,size: w*0.05)

                ],),
              ]
            ),
            SizedBox(height: 10),
            Prop('Address :  ', data['location_string']),
            SizedBox(height: 10),
            Prop('Hotel Class :', ' $a-Star'),
            SizedBox(height: 10),
            Prop('Open :  ', ' Yes '),
            SizedBox(height: 5),
            Text('Photos',style: Style1(size: w*0.05,bold: true),),
            SizedBox(
              height: w*0.5,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                          constraints: BoxConstraints(
                          maxWidth: w-20,
                          minWidth:100,
                            minHeight: 50,
                            maxHeight: 100
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl:data['photo']['images'][photos[index]]['url'],
                            fit: BoxFit.cover,
                          ),
                        ),

                      ),
                    );
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget Prop(String s1,String s2){
    return Wrap(
      children: [
      Text(s1,style: Style1(bold: true,size: w*0.035),),
      Text(s2,style: Style1(size: w*0.03),maxLines: 2,)
    ],);
  }
}
