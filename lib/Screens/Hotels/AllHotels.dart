import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/Screens/Hotels/Hotels%20Details.dart';
import 'package:travel_app/components/TextStyles.dart';
class AllHotels extends StatefulWidget {
  AllHotels({Key? key,this.data,this.cat}) : super(key: key);
  var data,cat;
  @override
  State<AllHotels> createState() => _AllHotelsState();
}

class _AllHotelsState extends State<AllHotels> {
  var data,h,w,cat;
  @override
  Widget build(BuildContext context) {
    data = widget.data;
    cat = widget.cat;
    h=MediaQuery.of(context).size.height;
    w=MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(cat,style: title(bold: true),),
        centerTitle: true,
        backgroundColor:Color(0xfff4c2c2),
      ),
      backgroundColor: Color(0xfff4c2c2),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
        child: ListView.builder(
             itemCount: data.length,
            itemBuilder: (context,index){
              return  InkWell(
                onTap: (){
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>HotelsDetail(data: data[index],cat: cat,)));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Container(
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
                                  tag: '$cat ${data[index]['location_id']}',
                                  child: CachedNetworkImage(
                                    imageUrl: data[index]['photo']['images']['original']['url'],
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
                                Text(data[index]['name'],style: title(size: w*0.04,color: Colors.black,bold: true),maxLines: 1,),
                                SizedBox(height: 5),
                                Text(data[index]['location_string'],style: Style1(size: w*0.032,color: Colors.black),),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('    ${data[index]['rating']} ⭐',style: Style1(size:w*0.03),),
                                    Text('${data[index]['price']}  /\nnight',style: Style1(size: w*0.03,bold: true,color: Colors.black),)
                                  ],
                                )
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                ),
              );

            }
        ),
      ),
    );
  }
}
