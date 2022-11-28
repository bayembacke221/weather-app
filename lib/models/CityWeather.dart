import 'package:weather_app/models/Clouds.dart';
import 'package:weather_app/models/Coordinate.dart';
import 'package:weather_app/models/Weather.dart';
import 'package:weather_app/models/Wind.dart';

import 'Mains.dart';
import 'Sys.dart';

class CityWeather {
  late int id;
  late String name ;
  late int dt ;
  late String base ;
  late int cod ;
  late int visibility ;
  late Coordinate coordinate ;
  late Clouds clouds ;
  late List<Weather> weatherList ;
  late Mains mains ;
  late Wind wind ;
  late Sys sys ;

  CityWeather.toJson(dynamic resJson){
    this.id = resJson["id"];
    this.name = resJson["name"];
    this.dt = resJson["dt"];
    this.base = resJson["base"];
    this.cod = resJson["cod"];
    this.visibility = resJson["visibility"];
    this.coordinate = Coordinate.toJson(resJson["coord"]);
    this.weatherList = (resJson["weather"] as List)
        .map((item) => Weather.fromJson(item))
        .toList();
    this.mains = Mains.toJson(resJson["main"]);
    this.clouds = Clouds.fromJson(resJson["clouds"]);
    this.wind = Wind.toJson(resJson["wind"]);
    this.sys = Sys.toJson(resJson["sys"]);
  }


}