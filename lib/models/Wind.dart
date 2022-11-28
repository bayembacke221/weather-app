class Wind {
  late double  speed;
  late int  deg;
  Wind.toJson(dynamic resJson){
    this.speed = resJson["speed"];
    this.deg = resJson["deg"];
  }
}