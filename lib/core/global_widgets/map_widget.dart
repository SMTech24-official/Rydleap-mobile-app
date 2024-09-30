




import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../feature/home/map_controller.dart';

class MapWidget extends StatelessWidget{


  MapController mapController = Get.find();

  // LatLng currentpos = LatLng(31.119318, -99.245435);
  final double height;
  final double width;

   MapWidget({super.key, required this.height, required this.width});



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: Obx(()=>GoogleMap(
        //initialCameraPosition: _kGoogle,
        markers: {
          Marker(
            markerId: MarkerId("Source"),
            position: mapController.currentpos.value,
          ),
        },
        mapType: MapType.normal,
        myLocationEnabled: true,
        compassEnabled: true,
        initialCameraPosition: CameraPosition(
          target: mapController.currentpos.value,
          zoom: 13,
        ),
        onMapCreated: (GoogleMapController controller) {

          mapController.getCurrentPos(controller);
          //_controller.complete(controller);
        },
      )),
    );
  }

}