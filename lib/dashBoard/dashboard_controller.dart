import 'dart:io';
import 'package:dev_rinkesh_test/service/hive_db.dart';
import 'package:dev_rinkesh_test/dashBoard/location_Service.dart';
import 'package:dev_rinkesh_test/model/location_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
class DashBoardController extends GetxController{

  var locationList = <LocationModel>[].obs;
  var hA =<HiveAirport>[].obs;
  List<HiveAirport> get getHA => hA.value;
  List<LocationModel> get getLocationList => locationList.value;
  setLocation( LocationModel locationModel)  async{

    locationList.value.add(locationModel);
    var localAirportList = HiveAirport(city: locationModel.city,country: locationModel.country,elevation: locationModel.elevation,iata: locationModel.iata,icao: locationModel.icao,lat: locationModel.lat,lon: locationModel.lon,name: locationModel.name,state: locationModel.state,tz: locationModel.tz);
    hA.value.add(localAirportList);
    locationList.refresh();
    hA.refresh();
  }
  LocationService _locationService = LocationService();

  getResponse()  async{
    //locationList.clear();

    try{

      print("--------Connection------------");
      print(getLocationList.length);
      print(getHA.length);
      bool conn = await getConnectivityStatus();
      if(conn){
        Map locationModel = await _locationService.getLocation();
        locationModel.forEach((key, value) {
          LocationModel locationModel = LocationModel.fromJson(value);
          setLocation(locationModel);
        });
        var box = await Hive.openBox('db');
        await box.delete("localAirPort");
        await box.put('localAirPort', hA);
      }else{

        print("-----------No Connection---------");
        var box = await Hive.openBox('db');
        var hiveAirport = await box.get('localAirPort');
        print(hiveAirport);
        if(hiveAirport !=null){
          hiveAirport.forEach((element) {
            LocationModel locationModel = LocationModel(tz:element.tz,state: element.state,name: element.name,lon: element.lon,lat: element.lat,icao: element.icao,iata: element.iata,elevation: element.elevation,country: element.country,city: element.city );
            setLocation(locationModel);
          });
        }

      }

    }catch(exeption){
      Get.snackbar("Error", exeption);
      throw exeption;
    }


  }

 Future<bool> getConnectivityStatus() async{

    try {
      final result = await InternetAddress.lookup('www.google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        Get.snackbar("Network", "Internet Connected");
       return true;
      }
    } on SocketException catch (_) {
      Get.snackbar("Network", "No Internet Local data Fetching.....");
      return false;
    }

  }
}