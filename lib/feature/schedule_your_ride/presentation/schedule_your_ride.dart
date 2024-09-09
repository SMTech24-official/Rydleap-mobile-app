




import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/feature/contact/presentation/contact.dart';

import '../../../core/app_sizes.dart';
import '../../../core/global_widgets/custom_gradient_button.dart';
import '../../../core/global_widgets/pickup_and_drop_input_tile.dart';
import '../../../core/global_widgets/ride_type_tile.dart';

class ScheduleYourRide extends StatefulWidget {
  @override
  State<ScheduleYourRide> createState() => _ScheduleYourRideState();
}

class _ScheduleYourRideState extends State<ScheduleYourRide>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  ScrollController _scrollController = ScrollController();











  // late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
  // RestorableRouteFuture<DateTime?>(
  //   onComplete: _selectDate,
  //   onPresent: (NavigatorState navigator, Object? arguments) {
  //     return navigator.restorablePush(
  //       _datePickerRoute,
  //       arguments: _selectedDate.value.millisecondsSinceEpoch,
  //     );
  //   },
  // );


  // RxInt i=0.obs;

  TimeOfDay selectedTimeRTL=TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    // Handle tab switching
    _tabController!.addListener(() {
      if (_tabController!.indexIsChanging) {
        // Scroll the listview horizontally based on the selected tab
        _scrollController.animateTo(
          _tabController!.index * MediaQuery.of(context).size.width,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _tabController?.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            Text('Schedule Your Ride'),
            CircleAvatar(
              radius: 17,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 14,
                child: Icon(
                  Icons.question_mark,
                  size: 25,
                  color: Colors.white,
                ),
                backgroundColor: Colors.blue,
              ),
            )
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [



          InkWell(
            onTap: (){
               selectedTimeRTL=showTimePicker(
                initialTime: TimeOfDay.now(),
                context: context,
              ) as TimeOfDay;
            },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border.all(width: 1,color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                  width: screenWidth(),
                  height: 50,
                  child: Text('${selectedTimeRTL.hour} :${selectedTimeRTL.minute<10?'0':''} ${selectedTimeRTL.minute} ${selectedTimeRTL.period.name}',style: GoogleFonts.nunito(

                      fontSize: 15,
                      fontWeight: FontWeight.w400

                  ),
                  ),
              ),
          ),




          InkWell(
            onTap: (){




              showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  //which date will display when user open the picker
                  firstDate: DateTime(1950),
                  //what will be the previous supported year in picker
                  lastDate: DateTime.now());




            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border.all(width: 1,color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                width: screenWidth(),
                height: 50,
                child: Text('00:00',style: GoogleFonts.nunito(

                    fontSize: 15,
                    fontWeight: FontWeight.w400

                ),)),
          ),




          PickupAndDropInputTile(
            backGroundColor: Colors.black,
            width: 90.w,
          ),

          TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'Economy'),
              Tab(text: 'Premium'),
              Tab(text: 'Shared'),
            ],
          ),

          Container(
            width: screenWidth(),
            height: 129,
            child: ListView(
              scrollDirection: Axis.horizontal,
              controller: _scrollController,
              shrinkWrap: true,
              children: [
                RideTypeTile(
                  title: 'Economy',
                  subtitle: '\$10-15',
                  time: '5 mins away',
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                ),
                RideTypeTile(
                  title: 'Premium',
                  subtitle: '\$15-20',
                  time: '3 mins away',
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                ),
                RideTypeTile(
                  title: 'Shared',
                  subtitle: '\$05-10',
                  time: '10 mins away',
                  backgroundColor: Colors.green.shade500,
                  textColor: Colors.amber,
                ),

              ],
            ),
          ),

          CustomGradientButton(
            text: 'Schedule Ride',
            onTap: () {

              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => Contact()));

            },
            width: getWidth(335),
            icon: Icons.calendar_today_outlined,
          ),

          SizedBox(height: 12,),

          CustomGradientButton(
            text: 'Back',
            onTap: () {},
            width: getWidth(335),
            colorList: [Color(0xff9B9B9B),Color(0xff9B9B9B),],
          ),




        ],
      ),
    );
  }
}
