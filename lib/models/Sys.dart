class Sys {
  late int type;
  late int id;
  late String country;
  late int sunrise;
  late int sunset;

  Sys( this.type, this.id, this.country,  this.sunrise,  this.sunset);

   Sys.toJson(Map<String, dynamic> json) {

        this.type= json['type'];
        this.id= json['id'];
        this.country=  json['country'];
        this.sunset=  json['sunset'];
        this.sunrise=  json['sunrise'];
  }

}