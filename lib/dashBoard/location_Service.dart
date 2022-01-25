import 'dart:convert';

import 'package:dev_rinkesh_test/model/location_model.dart';
import 'package:http/http.dart' as http;
class LocationService {

  Future<Map> getLocation({String page}) async{
    try{
      var url = Uri.parse('https://raw.githubusercontent.com/mwgg/Airports/master/airports.json');
      var response = await http.get(url);
      Map mapLocation = jsonDecode(response.body.toString());
      return mapLocation;
    }catch(exception){
      throw exception;
    }
  }
}