import 'package:dev_rinkesh_test/app_Utils/circullerProgreess.dart';
import 'package:dev_rinkesh_test/app_Utils/common.dart';
import 'package:dev_rinkesh_test/app_Utils/noDataFound.dart';
import 'package:dev_rinkesh_test/dashBoard/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardView extends StatefulWidget {
  @override
  _DashBoardViewState createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {
  DashBoardController _dashBoardController = Get.put(DashBoardController());
  @override
  void initState() {

    _dashBoardController.getResponse();
    _dashBoardController.getConnectivityStatus();

    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: CommonText(text: "Airports",fontSize: 20,fontStyle: FontWeight.bold),),
      body: dashboardList(),
    );
  }

  Widget dashboardList() {
    print("-------lflflflfl-----");
    print(_dashBoardController.getLocationList.length==0);
    print(_dashBoardController.getLocationList != null);
    return Obx(() {
      if (_dashBoardController.getLocationList.isBlank ) {
        return CircularProgress();
      }
      if (_dashBoardController.getLocationList != null &&
          _dashBoardController.getLocationList.length == 0) {
        return NoDataFound(
          text: 'No Airport Found',
        );
      }
      if (_dashBoardController.getLocationList != null &&
          _dashBoardController.getLocationList != null)
        return Center(
          child: ListView.builder(
              itemCount: _dashBoardController.getLocationList.length,
              itemBuilder: (context, index) {
                return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              CircleAvatar(backgroundColor: Colors.amber,child: Image.asset("assets/icons/airport.png",height: 20,width: 20,)),
                              SizedBox(width: 10,),
                              Expanded(
                                child: CommonText(
                                    text: _dashBoardController
                                        .getLocationList[index].name,
                                    fontSize: 18,
                                    fontStyle: FontWeight.bold),
                              ),
                              CommonText(
                                text: _dashBoardController
                                    .getLocationList[index].country,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:30 ),
                            child: Row(
                              children: [
                                Icon(Icons.location_on_outlined,color: Colors.amber,),
                                CommonText(
                                    text:
                                    "${_dashBoardController.getLocationList[index].city} ,${_dashBoardController.getLocationList[index].state} ,${_dashBoardController.getLocationList[index].country} ",
                                    fontSize: 10,
                                    textColor: Colors.grey,
                                    fontStyle: FontWeight.bold),
                              ],
                            ),
                          )
                        ],
                      ),
                    ));
              }),
        );
      return SizedBox();
    });
  }
}
