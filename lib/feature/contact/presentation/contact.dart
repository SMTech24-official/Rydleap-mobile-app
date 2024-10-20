// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/custom_gradient_button.dart';
import 'package:rydleap/feature/contact/controller/contact_controller.dart';
import 'package:rydleap/feature/driver_tracking/presentation/driver_tracking.dart';
import 'package:rydleap/feature/home/map_controller.dart';
import 'package:rydleap/feature/request_a_ride/model/riding_request_model.dart';

import '../../../core/utility/app_colors.dart';

class Contact extends StatelessWidget {


  Rx<BitmapDescriptor> customIcon=BitmapDescriptor.defaultMarker.obs;
  Rx<BitmapDescriptor> customDestinationIcon=BitmapDescriptor.defaultMarker.obs;








  void setCustomDestinationMarkerIcon() async {


    customDestinationIcon.value = await BitmapDescriptor.asset(
      ImageConfiguration(size: Size(24, 24)), // Adjust size as needed
      'assets/images/destination.png', // Path to the image in assets
    );


    // setState(() {}); // Trigger a rebuild once the icon is loaded
  }



  final RidingRequestModel ridingRequestModel;
//jdfgjdfgjsfdg
//   double poslat = 0.00;
//   double poslong = 0.00;
//   LatLng currentpos = LatLng(31.119318, -99.245435);




  MapController mapController = Get.find();
  ContactController contactController=Get.find();

   Contact({super.key, required this.ridingRequestModel});

  @override
  Widget build(BuildContext context) {

    contactController.getDriver('6708fca149eac1ee4a4dd86c');

    setCustomDestinationMarkerIcon();
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios)),
            Text('Contact'),
            CircleAvatar(
              radius: 17,
              backgroundColor: Colors.grey,
              child: CircleAvatar(
                radius: 14,
                child: Icon(
                  Icons.notification_important_outlined,
                  size: 16,
                  color: Colors.grey,
                ),
                backgroundColor: Colors.white,
              ),
            )
          ],
        ),
      ),


      body: Column(
        children: [


          
          Container(
            height: 37.5.h,
            width: 100.w,
            margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            child: Obx(()=>GoogleMap(

              // polylines: mapController.polylines,
              //initialCameraPosition: _kGoogle,
              markers: {



                // Marker(
                //   icon: customIcon.value,
                //   markerId: MarkerId("?Source"),
                //   position: LatLng(ridingRequestModel.data?.assignedRider?.locations?.first.locationLat??0.00, ridingRequestModel.data?.assignedRider?.locations?.first.locationLng??0.00,),
                // ),

                Marker(
                  markerId: MarkerId("Source"),
                  position: LatLng(ridingRequestModel.data?.ride?.pickupLat??0.00, ridingRequestModel.data?.ride?.pickupLng??0.00),
                ),


                Marker(
                  icon: customDestinationIcon.value,
                  markerId: MarkerId("?Source"),
                  position: LatLng(ridingRequestModel.data?.ride?.destinationLat??0.00, ridingRequestModel.data?.ride?.destinationLng??0.00,),
                ),

                // Marker(
                //   markerId: MarkerId("Source"),
                //   position: mapController.currentpos.value,
                // ),
              },
              mapType: MapType.normal,
              myLocationEnabled: true,
              compassEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(ridingRequestModel.data?.ride?.pickupLat??0.00, ridingRequestModel.data?.ride?.pickupLng??0.00),
                zoom: 13,
              ),
              onMapCreated: (GoogleMapController controller) {

                mapController.getCurrentPos(controller);
                //_controller.complete(controller);
              },
            ),),
          ),




          SizedBox(
            height: 16,
          ),
          Container(
            height: 45.2.h,
            width: 100.w,
            child: Container(
                height: 10.h,
                width: 100.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                  color: Colors.black,
                  border: Border.all(width: 1, color: Colors.amber),
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
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 4,
                      width: 48,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Arrive in 3 mins (120m)',
                      style: GoogleFonts.inter(
                          fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 18),
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xFF001B26),
                            const Color(0xFF00638C),
                          ],),

                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                            
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                            
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      width: getWidth(77),
                                      height: getHeight(29),

                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 2,vertical: 0),
                                      child:

                                      Obx(()=>Text(
                                        '${contactController.riderModel.value.data?.riderVehicleInfo?.first.vehicleLicensePlateNumber}',
                                        style: GoogleFonts.inter(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                        maxLines: 1,
                                      ),),

                                    ),
                            
                            
                                    SizedBox(height: 10,),

                                    Obx(()=>Text(
                                      '${contactController.riderModel.value.data?.riderVehicleInfo?.first.vehicleModel}, ${contactController.riderModel.value.data?.riderVehicleInfo?.first.vehicleColor}',
                                      style: GoogleFonts.inter(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),),

                                  ],
                                ),


                                Obx(()=>Image.asset('${contactController.riderModel.value.data?.profileImage??'assets/images/car3d.png'}',width: getWidth(86),height: getHeight(68),))
                                //assets/images/car3d.png
                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [


                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: getHeight(80),
                                    width: getWidth(80),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(image: AssetImage('assets/images/dummy_customer_image.png'))
                                    ),
                                  ),

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [


                                      Text('${ridingRequestModel.data?.assignedRider?.fullName}',style: GoogleFonts.inter(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),),

                                      Row(
                                        children: [
                                          for(int i=0;i<5;i++)
                                            Icon(Icons.star,size: 10,color: i<4?Colors.amber:Colors.grey)
                                        ],
                                      ),


                                      Row(
                                        children: [
                                          Text('4.6',style: GoogleFonts.inter(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),),

                                          Obx(()=>Text('(${contactController.riderModel.value.data?.ridesAsRider?.length} trips)',style: GoogleFonts.inter(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),),),



                                        ],
                                      )



                                    ],
                                  )


                                ],
                              ),


                              Container(
                                height: getHeight(60),
                                width: getWidth(60),
                                decoration: BoxDecoration(
                                  color: Color(0xff3AD896),
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Icon(Icons.call),
                              )



                            ],
                          ),
                        ],
                      ),
                    ),



                    SizedBox(
                      height: 20,
                    ),
                    
                    CustomGradientButton(text: 'Confirm', onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => DriverTracking(ridingRequestModel: ridingRequestModel,)));
                    },width: screenWidth()-32,),
                    // CustomGradientButton(text: 'Cancel Ride', onTap: (){},icon: Icons.cancel,width: screenWidth()-32,)

                    
                    
                    
                    
                  ],
                )),
          )
        ],
      ),
    );
  }
}
