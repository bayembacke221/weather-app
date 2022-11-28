class Mains{
  late double temp;
  late double feels_like;
  late double temp_min;
  late double temp_max;
  late int  pressure;
  late int humidity;
  Mains.toJson(dynamic resJson){
    this.temp = resJson["temp"];
    this.feels_like = resJson["feels_like"];
    this.temp_min = resJson["temp_min"];
    this.temp_max = resJson["temp_max"];
    this.pressure = resJson["pressure"];
    this.humidity = resJson["humidity"];
  }
}