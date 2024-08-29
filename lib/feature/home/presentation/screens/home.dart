import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class Home extends StatefulWidget {
   Home({super.key});

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();


  double poslat=0.00;
  double poslong=0.00;
  LatLng currentpos=LatLng(23.7547124, 90.3630302);


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,

        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/images/main_logo.png',width: 48,height: 45,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Hello,",
                  style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w500,
                  fontSize: 25
                ),
                ),
                Text("User", style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w400,
                    fontSize: 12
                ),),
              ],
            ),


            CircleAvatar(
              backgroundColor: Colors.grey.shade300.withOpacity(.3),
              radius: 23,
              child: CircleAvatar(
                radius: 20.5,
                backgroundColor: Colors.grey.shade300.withOpacity(.7),
                child: CircleAvatar(
                  radius: 17,
                  child: Icon(Icons.notifications_none,size: 25,color: Colors.black,),
                  backgroundColor: Colors.grey.shade300,
                ),
              ),
            )



          ],
        ),
      ),
      body: Container(

        height: 100.h,
        width: 100.w,
        margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: GoogleMap(
          //initialCameraPosition: _kGoogle,
          markers: {
            Marker(
              markerId: MarkerId("Source"),
              position: currentpos,
            ),
          },
          mapType: MapType.normal,
          myLocationEnabled: true,
          compassEnabled: true,
          initialCameraPosition: CameraPosition(
            target: currentpos,
            zoom: 13,
          ),
          onMapCreated: (GoogleMapController controller){
            //_controller.complete(controller);
          },
        ),
      ),
    );
  }
}