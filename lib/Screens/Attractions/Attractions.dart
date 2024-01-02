import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/Screens/Attractions/AttractionsSearch.dart';
import 'package:travel_app/backend/backend.dart';
import 'package:travel_app/components/TextStyles.dart';
import 'package:velocity_x/velocity_x.dart';
class Attractions extends StatefulWidget {
  const Attractions({Key? key}) : super(key: key);

  @override
  State<Attractions> createState() => _AttractionsState();
}

class _AttractionsState extends State<Attractions> {

var h,w;
List data = [];
int _currIndex=-1;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  getData() async{
    data=await getAttractions();
    if(data.isNotEmpty){
      setState(() {

      });
    }
  }
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
                    padding: EdgeInsets.only(bottom: h*0.02),
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
                                      MaterialPageRoute(builder: (context)=>AttractionSearch()));
                                },
                                icon: Icon(Icons.search,size: w*0.065,color: Colors.white,))
                          ],
                        ),
                        Text('Great Places\n have Great History',
                          style: title(size: h*0.03,bold:true),
                          textAlign: TextAlign.center,)
                      ],

                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
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
                        ],
                      ),
                    ),
                    BuildAttractions(getAttractions(), 'Attractions')
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
Widget BuildAttractions(Future func,String string){
  return Column(
    children: List.generate(data.length,(index){
       bool more=index==_currIndex?true:false;
      return InkWell(
        onTap: (){
          _currIndex=_currIndex==-1?index:_currIndex==index?-1:index;

          setState(() {

          });
        },

        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child:HotelContainer(data[index], string,more),
        ),
      );
    }),
  );
}
Widget HotelContainer(var data,var string,bool more){

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
              Wrap(
                children: [
                  Text('Address: ',style: Style1(size: w*0.027,color: Colors.black,bold: true),),
                  Text(data['address'],style: Style1(size: w*0.027,color: Colors.black),),
                ],
              ),
              SizedBox(height: 5),
              Text(data['ranking_subcategory'],style: Style1(size: w*0.03,color: Colors.black,bold: true),),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${data['rating']} ⭐',style: Style1(size:w*0.03),),
                  Text('${data['subcategory'][0]['name']}',style: Style1(size: w*0.03,bold: true,color: Colors.black),)
                ],
              ),
              more
                  ?Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    data['description'].isEmpty
                         ?Text('No Description',style: Style1(bold: true,size: w*0.04))
                         :Text('Description',style: Style1(bold: true,size: w*0.04),),
                    Text('${data['description']}',style: Style1(size: w*0.03),),
                    Center(child: Text('Show Less'))
                  ],
                ),
              )
                  :Align(
                alignment: Alignment.center,
                child: Text('Read more',style: Style1(color: Colors.grey,bold: true,size: 15),),
              )
            ],
          ),
        ),

      ],
    ),
  );
}
}
