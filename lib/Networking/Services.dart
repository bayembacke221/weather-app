import 'dart:convert';

import 'package:weather_app/models/Coordinate.dart';

import '../models/CityWeather.dart';
import 'package:http/http.dart' as http;

class Services{
  static String appid = "51663d3c484f2d7d48d8a3ab31715333";

  static Future<CityWeather>  getCoordinate(double latitude,double longitude) async{
     String url = "https://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=${appid}&units=metric";

     var request = await http.get(Uri.parse(url));
     if (request.statusCode == 200) {
       var result = json.decode(request.body);
       var model = CityWeather.toJson(result);
       print(model);
       return model;
     } else
       throw Exception('Failed to load Weather Information');

  }
}