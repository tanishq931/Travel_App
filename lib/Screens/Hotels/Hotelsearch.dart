import 'package:flutter/material.dart';
import 'package:travel_app/Screens/Hotels/Hotels%20Details.dart';
import 'package:travel_app/backend/backend.dart';
import 'package:travel_app/components/TextStyles.dart';
class HotelSearch extends StatefulWidget {
 const HotelSearch({Key? key}) : super(key: key);
  @override
  State<HotelSearch> createState() => _HotelSearchState();
}

class _HotelSearchState extends State<HotelSearch> {
  bool selected=false;
  var search= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff4c2c2),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  style: Style1(),
                  controller: search,
                  onChanged: (val){
                    setState(() {

                    });
                  },
                  onTap: (){
                    setState(() {
                      selected=!selected;
                    });
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey.shade700,
                        width: 2
                      ),

                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.orange.shade700,
                        width: 2
                      ),

                    ),
                    suffixIcon: IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.search),
                    ),
                    suffixIconColor: selected?Colors.orange.shade700:Colors.grey.shade700,
                    prefixIconColor: selected?Colors.orange.shade700:Colors.grey.shade700,
                    prefixIcon: IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                    )
                  ),
                ),
                SizedBox(height: 10,),
                search.text.isEmpty
                    ?Center(child: Text('Enter a character to start search'))
                    :FutureBuilder(
                  future: hotelSearch(),
                  builder: (context, AsyncSnapshot snapshot){
                    if(snapshot.hasData) {
                      var data = snapshot.data;
                      return SizedBox(
                        height: 500,
                        child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              if (data[index]['name'].toLowerCase().contains(search.text.toLowerCase())) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) =>
                                            HotelsDetail(data: data[index])));
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          '${data[index]['name']}',
                                          style: Style1()),
                                      SizedBox(height: 5,),
                                      Divider(thickness: 2, color: Colors.black,),
                                    ],
                                  ),
                                );
                              }
                              else {
                                return SizedBox();
                              }
                            }),
                      );
                    }
                    else{
                      return CircularProgressIndicator();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
