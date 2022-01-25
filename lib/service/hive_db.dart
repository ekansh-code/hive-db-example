

import 'package:hive/hive.dart';
part 'hive_db.g.dart';


@HiveType(typeId: 0)
class HiveAirport  {

  HiveAirport({this.icao,
    this.iata,
    this.name,
    this.city,
    this.state,
    this.country,
    this.elevation,
    this.lat,
    this.lon,
    this.tz});

  @HiveField(0)
  String icao;
  @HiveField(1)
  String iata;
  @HiveField(2)
  String name;
  @HiveField(3)
  String city;
  @HiveField(4)
  String state;
  @HiveField(5)
  String country;
  @HiveField(6)
  int elevation;
  @HiveField(7)
  var lat;
  @HiveField(8)
  var lon;
  @HiveField(9)
  String tz;

}
