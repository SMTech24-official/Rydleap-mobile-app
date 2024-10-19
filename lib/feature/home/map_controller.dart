



import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class MapController extends GetxController{


  RxSet<Polyline> polylines = <Polyline>{}.obs;
  Stream<Position>? positionStream;
  Rx<LatLng> currentpos = LatLng(31.119318, -99.245435).obs;

  RxList<LatLng> polylineCoordinates = <LatLng>[].obs;




  // Future<void> getPolylineFromGoogleDirections(LatLng start, LatLng end) async {
  //   final String url =
  //       'https://maps.googleapis.com/maps/api/directions/json?origin=${start.latitude},${start.longitude}&destination=${end.latitude},${end.longitude}&key=$apiKey';
  //
  //   final response = await http.get(Uri.parse(url));
  //
  //   if (response.statusCode == 200) {
  //     final data = json.decode(response.body);
  //     if (data['status'] == 'OK') {
  //       final polylineEncoded = data['routes'][0]['overview_polyline']['points'];
  //       polylineCoordinates.value = _decodePolyline(polylineEncoded);
  //
  //       // Now create a polyline and update the map
  //       final polyline = Polyline(
  //         polylineId: PolylineId('route_polyline'),
  //         points: polylineCoordinates.toList(),
  //         color: Colors.blue,
  //         width: 5,
  //       );
  //       polylines.value = {polyline};
  //     } else {
  //       throw Exception('Error fetching directions: ${data['status']}');
  //     }
  //   } else {
  //     throw Exception('Failed to connect to Google Directions API');
  //   }
  // }



  void addPolylineBetweenLocations(LatLng start, LatLng end) {



    polylineCoordinates.clear(); // Clear existing polyline points

    polylineCoordinates.add(start); // Add the starting point
    polylineCoordinates.add(end);   // Add the ending point

    final polyline = Polyline(
      polylineId: PolylineId('dynamic_polyline'),
      points: polylineCoordinates.toList(),  // Add dynamic list of points
      color: Colors.blue,
      width: 5,
    );

    polylines.value.add(polyline);  // Update the reactive Set of polylines
  }






  @override
  void onInit() {
    super.onInit();
    //getCurrentPos();


  }





  double randLat(double lat){

    Random rnd = new Random();
// Define min and max value
    int min = 1, max = 10;
    int mult=-1;
//Getting range
    int num = min + rnd.nextInt(max - min);
    if(num%2==0){

      mult=1;

    }else{
      mult=-1;
    }

    return (((num/10000)*mult)+lat);

  }


  double randLong(double long){

    Random rnd = new Random();
// Define min and max value
    int min = 1, max = 10;
    int mult=-1;
//Getting range
    int num = min + rnd.nextInt(max - min);
    if(num%2==0){

      mult=1;

    }else{
      mult=-1;
    }

    return (((num/10000)*mult)+long);

  }






  Future<void> getCurrentPos(GoogleMapController mapController) async {





    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    // Check location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // Get the position stream
    positionStream = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high, // High accuracy
        distanceFilter: 10, // Update if user moves 10 meters
      ),
    );

    positionStream!.listen((Position position) {

        // currentPosition = position;
        currentpos.value=LatLng(position.latitude, position.longitude);

        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: currentpos.value,
              zoom: 14, // You can change the zoom level here
            ),
          ),
        );

        addPolylineBetweenLocations(currentpos.value,LatLng(23.767961, 90.423319));


        // polylines.add(Polyline(
        //   polylineId: PolylineId('line1'),
        //   visible: true,
        //   //latlng is List<LatLng>
        //   points: [currentpos.value,LatLng(23.767961, 90.423319)],
        //   width: 2,
        //   color: Colors.green,
        // ));

        //different sections of polyline can have different colors



        // _polyline.add(Polyline(
        //   polylineId: PolylineId('line2'),
        //   visible: true,
        //   //latlng is List<LatLng>
        //   points: latlngSegment2,
        //   width: 2,
        //   color: Colors.red,
        // ));





    });


  }

  @override
  void onReady() {

  }

  @override
  void onClose() {

  }
}