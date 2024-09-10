



// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/utility/app_colors.dart';

class Contact extends StatelessWidget{


  double poslat = 0.00;
  double poslong = 0.00;
  LatLng currentpos = LatLng(23.7547124, 90.3630302);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [


          Container(
            height: 50.h,
            width: 100.w,
            margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
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
              onMapCreated: (GoogleMapController controller) {
                //_controller.complete(controller);
              },
            ),
          ),


          SizedBox(height: 16,),


          SingleChildScrollView(
            child: Container(
              height: 45.2.h,
              width: 100.w,

              child: Container(

                height: 10.h,
                width: 100.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  color: Colors.black,
                  border: Border.all(width: 1,color: Colors.amber ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.lightPrimary,
                      spreadRadius: 7,
                      blurRadius: 22,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],

                ),
                child: Column(
                  children: [
                    Text('Arrive in 3 mins (120m)'),


                    Container(

                      child: Row(
                        children: [
                          Column(
                            children: [
                              
                            ],
                          ),

                          Column(
                            children: [

                            ],
                          ),



                        ],
                      ),



                    )



                  ],
                )

              ),
            ),
          )




        ],
      ),
    );
  }

}