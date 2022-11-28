class Coordinate{
  late double latitude ;
  late double longitude ;
  Coordinate(this.latitude,this.longitude);

  Coordinate.toJson(dynamic resJson){
    this.latitude = resJson["lat"];
    this.longitude = resJson["lon"];
  }
}