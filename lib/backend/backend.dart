import 'dart:convert';
import 'package:flutter/services.dart';
String apikey='7ae8db8f74mshcbb96eb67060899p15856cjsndc106cc54a2e';
String geoId='304555';
String checkIn='2023-11-10';
String checkOut='2023-11-15';
getHotels() async{
  dynamic response = await rootBundle.loadString('assets/backend/Jaipur/Hotels/Hotels.json');
  var data = jsonDecode(response.toString());
  return data['data'];
}
getTrending() async{
  dynamic response = await rootBundle.loadString('assets/backend/Jaipur/Hotels/Trending.json');
  var data = jsonDecode(response.toString());
  return data['data'];
}
getRoyal() async{
  dynamic response = await rootBundle.loadString('assets/backend/Jaipur/Hotels/Royal.json');
  var data = jsonDecode(response.toString());
  return data['data'];
}
hotelSearch() async{
  dynamic response = await rootBundle.loadString('assets/backend/Jaipur/Hotels/Search.json');
  var data = jsonDecode(response.toString());
  return data['data'];
}
getAttractions() async{
  dynamic response = await rootBundle.loadString('assets/backend/Jaipur/Attractions/Attractions.json');
  var data = jsonDecode(response.toString());
  return data['data'];
}
getRestaurants1() async{
  dynamic response = await rootBundle.loadString('assets/backend/Jaipur/Restaurants/Restaurant3.json');
  var data = jsonDecode(response.toString());
  return data['data'];
}
getRestaurants2() async{
  dynamic response = await rootBundle.loadString('assets/backend/Jaipur/Restaurants/Restaurant1.json');
  var data = jsonDecode(response.toString());
  return data['data'];
}
getRestaurants3() async{
  dynamic response = await rootBundle.loadString('assets/backend/Jaipur/Restaurants/Restaurant.json');
  var data = jsonDecode(response.toString());
  return data['data'];
}