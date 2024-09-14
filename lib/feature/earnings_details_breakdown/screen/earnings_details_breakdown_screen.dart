import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../core/app_imagese.dart';
import '../../../core/app_sizes.dart';
import '../../../core/global_widgets/custom_close_button.dart';
import '../../../core/utility/app_colors.dart';
import '../dummy_data/chart_data.dart';

class EarningsDetailsBreakdownScreen extends StatefulWidget {
  const EarningsDetailsBreakdownScreen({super.key});

  @override
  State<EarningsDetailsBreakdownScreen> createState() =>
      _EarningsDetailsBreakdownScreenState();
}

class _EarningsDetailsBreakdownScreenState
    extends State<EarningsDetailsBreakdownScreen> {
  String _selectedRange = 'Day'; // Default selected range is 'Day'

  List<ChartData> _chartData = [
    ChartData('Mo', 1500),
    ChartData('Tu', 1800),
    ChartData('We', 800),
    ChartData('Th', 1300),
    ChartData('Fr', 1600),
    ChartData('Sa', 700),
    ChartData('Su', 1400),
  ];
  PageController _pageController = PageController();
  int _selectedIndex = 0;

  // Sample data for each tab
  final List<List<Map<String, dynamic>>> _data = [
    [
      {'name': 'Burkina Faso', 'time': '5:20 pm', 'amount': 20.00},
      {'name': 'Mali', 'time': '6:15 pm', 'amount': 15.00},
      {'name': 'Senegal', 'time': '4:45 pm', 'amount': 35.00},
      {'name': 'Senegal', 'time': '4:45 pm', 'amount': 35.00},
      {'name': 'Senegal', 'time': '4:45 pm', 'amount': 35.00},
      {'name': 'Senegal', 'time': '4:45 pm', 'amount': 35.00},
      {'name': 'Senegal', 'time': '4:45 pm', 'amount': 35.00},
      {'name': 'Senegal', 'time': '4:45 pm', 'amount': 35.00},
    ],
    [
      {'name': 'Income Item 1', 'time': '2:30 pm', 'amount': 50.00},
      {'name': 'Income Item 2', 'time': '1:15 pm', 'amount': 60.00},
    ],
    [
      {'name': 'Withdrawn Item 1', 'time': '9:10 am', 'amount': 10.00},
      {'name': 'Withdrawn Item 2', 'time': '11:20 am', 'amount': 25.00},
    ],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: AppColors.textBlack,
          ),
          Image.asset(
            'assets/images/Ellipse_9.png',
            width: 150.w,
            height: 60.h,
            fit: BoxFit.cover,
          ),
          Container(
            height:
                getHeight(225), // Adjusted to match the height from the image
            width:
                double.infinity, // Adjusted to match the width from the image
            decoration: BoxDecoration(
              color: Color(
                  0xFF001B26), // Set the background color to match the image
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(getWidth(40)),
                bottomRight: Radius.circular(getWidth(40)),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(
                      0x26FFFFFF), // Adjusted color with opacity from the image (15%)
                  offset: Offset(0, 2), // X and Y values for the shadow
                  blurRadius: 7, // Blur radius as in the image
                  spreadRadius: 0, // Spread as specified
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  padding:
                      EdgeInsets.only(left: getWidth(20), top: getHeight(35)),
                  child: Row(
                    children: [
                      CustomCloseButton(),
                      SizedBox(
                        width: getWidth(100),
                      ),
                      Text(
                        'Earnings',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: getWidth(20),
                          height: getHeight(24.2) / getHeight(20),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getHeight(20),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: getWidth(149)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        size: getWidth(21),
                        color: Color(0xFF4B4B4B),
                      ),
                      SizedBox(
                        height: getHeight(7),
                      ),
                      Text(
                        '06/16/23',
                        style: GoogleFonts.inter(
                          color: Colors.white.withOpacity(0.87),
                          fontWeight: FontWeight.w500,
                          fontSize: getWidth(10),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getHeight(12),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: getWidth(113)),
                  child: Text(
                    '\$ 2000.34',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: getWidth(30),
                      height: getHeight(16) / getHeight(30),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: getHeight(160), // Adjusted top value
            left: getWidth(20), // Adjusted left value
            right: getWidth(20),
            child: Container(
              height: getHeight(272), // Adjusted height
              width: getWidth(336), // Adjusted width
              decoration: BoxDecoration(
                color: Color(0xFF001B26),
                borderRadius: BorderRadius.all(Radius.circular(16.88)),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF7088D2)
                        .withOpacity(0.2), // Adjusted shadow color and opacity
                    offset:
                        Offset(0, getHeight(8.44)), // Adjusted shadow offset
                    blurRadius: getWidth(25.33), // Adjusted blur radius
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: getHeight(17),
                  ),
                  Container(
                    height: getHeight(20),
                    width: getWidth(180),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: ToggleButtons(
                        borderRadius: BorderRadius.circular(getWidth(5.07)),
                        selectedColor: Colors
                            .black, // Set the selected text color to black
                        fillColor:
                            AppColors.white, // Background color for selected
                        isSelected: [
                          _selectedRange == 'Day',
                          _selectedRange == 'Week',
                          _selectedRange == 'Month'
                        ],
                        onPressed: (int index) {
                          setState(() {
                            if (index == 0) _selectedRange = 'Day';
                            if (index == 1) _selectedRange = 'Week';
                            if (index == 2) _selectedRange = 'Month';
                          });
                        },
                        children: [
                          Text(
                            'Day',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: getWidth(11.82),
                              height: getHeight(14.3) / getHeight(11.82),
                              color: _selectedRange == 'Day'
                                  ? Colors.black
                                  : Color(0xFFE3D8D8),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'Week',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: getWidth(11.82),
                              height: getHeight(14.3) / getHeight(11.82),
                              color: _selectedRange == 'Week'
                                  ? Colors.black
                                  : Color(0xFFE3D8D8),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'Month',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: getWidth(11.82),
                              height: getHeight(14.3) / getHeight(11.82),
                              color: _selectedRange == 'Month'
                                  ? Colors.black
                                  : Color(0xFFE3D8D8),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: getHeight(20)),
                  Container(
                      height: getHeight(140),
                      width: getWidth(295),
                      child: SfCartesianChart(
                        plotAreaBorderWidth: 0,
                        backgroundColor:
                            Colors.transparent, // Transparent background
                        primaryXAxis: CategoryAxis(
                          axisLine: AxisLine(
                              width: 0,
                              color:
                                  Colors.transparent), // Remove the X-axis line
                          majorGridLines: MajorGridLines(
                              width: 0,
                              color: Colors
                                  .transparent), // Remove X-axis grid lines
                          majorTickLines: MajorTickLines(
                              size: 0,
                              color: Colors.transparent), // Remove tick marks
                          labelStyle: TextStyle(
                            color: Colors.white, // Set white labels for X-axis
                            fontFamily: 'Rubik', // Font family
                            fontSize: 10.13, // Font size
                            fontWeight: FontWeight.w400, // Font weight
                            height: 16.88 /
                                10.13, // Line height (line-height / font-size)
                          ),
                        ),
                        primaryYAxis: NumericAxis(
                          minimum: 500, // Start the Y-axis at 500
                          maximum: 2000, // Set the maximum value of the Y-axis
                          interval:
                              500, // Interval of 500 between Y-axis ticks (500, 1000, 1500, 2000)
                          axisLine: AxisLine(
                              width: 0,
                              color: Colors.transparent), // Hide Y-axis line
                          majorTickLines:
                              MajorTickLines(size: 0), // Hide tick marks
                          labelStyle: TextStyle(
                            color: Colors.white, // Set white labels for Y-axis
                            fontFamily: 'Rubik', // Font family
                            fontSize: 10.13, // Font size
                            fontWeight: FontWeight.w400, // Font weight
                            height: 16.88 /
                                10.13, // Line height (line-height / font-size)
                          ),
                          majorGridLines: MajorGridLines(
                            width: 1, // Grid line width
                            color: Color(0xFF334951)
                                .withOpacity(0.2), // Faint grid lines
                          ),
                        ),
                        series: <ChartSeries>[
                          ColumnSeries<ChartData, String>(
                            color: Color(0xFF3AD896), // Green color for bars
                            borderRadius:
                                BorderRadius.circular(5), // Rounded bars
                            dataSource: _chartData,
                            xValueMapper: (ChartData data, _) => data.day,
                            yValueMapper: (ChartData data, _) => data.amount,
                            width: 0.3, // Adjust the width of bars
                            spacing: 0.2, // Space between bars
                          ),
                        ],
                      )),
                  SizedBox(
                    height: getHeight(10),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: getHeight(42),
                    width: getWidth(309),
                    decoration: BoxDecoration(
                        color: Color(0xFF3AD896),
                        borderRadius:
                            BorderRadius.all(Radius.circular(getWidth(6.75)))),
                    child: Text(
                      'Cash Out',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: getWidth(15.2),
                        height: getHeight(18.39) / getHeight(15.2),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: getHeight(480),
            left: getWidth(20),
            right: getWidth(20),
            child: Column(
              children: [
                Container(
                  height: getHeight(35),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildToggleButton('All', 0),
                      _buildToggleButton('Income', 1),
                      _buildToggleButton('Withdrawn', 2),
                    ],
                  ),
                ),
                SizedBox(height: getHeight(20)),
                Container(
                  height: getHeight(25),
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Today',
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w500,
                          fontSize: getWidth(18),
                          height: getHeight(25) / getHeight(18),
                        ),
                      ),
                      Text(
                        '-\$ 35.00',
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w400,
                          fontSize: getWidth(16),
                          height: getHeight(22) / getHeight(18),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: getHeight(12)),
                SizedBox(
                  height: getHeight(600),
                  width: double.infinity,
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (int index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    itemCount: _data.length,
                    itemBuilder: (context, pageIndex) {
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: _data[pageIndex].length,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            margin:
                                EdgeInsets.symmetric(vertical: getHeight(10)),
                            padding: EdgeInsets.symmetric(
                                vertical: 13, horizontal: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white.withOpacity(0.07),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  AppImagese.profileImage,
                                  width: 43,
                                  height: 43,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _data[pageIndex][index]['name'],
                                      style: GoogleFonts.nunito(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Container(
                                      width: getWidth(320),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            _data[pageIndex][index]['time'],
                                            style: GoogleFonts.nunito(
                                              color: Color(0xFFA6A6A6),
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            '\$${_data[pageIndex][index]['amount'].toStringAsFixed(2)}',
                                            style: GoogleFonts.nunito(
                                              color: _selectedIndex == 2
                                                  ? Color(
                                                      0xFFFF0000) // Red for Withdrawn
                                                  : Color(0xFF3AD896)
                                              , // White for Income
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        letIndexChange: (index) {
          return false;
        },
        height: 60,
        index: 1,
        backgroundColor: Colors.black,
        color: Color(0xffDEFF11),
        items: <Widget>[
          Icon(
            Icons.home_outlined,
            size: 25,
            color: Colors.black,
          ),
          Container(
            child: Column(
              children: [
                Transform.scale(
                  scale: .7,
                  // width: 32,
                  // height: 22,
                  child: Switch(
                    // This bool value toggles the switch.
                    value: true,
                    thumbColor:
                        const WidgetStatePropertyAll<Color>(Colors.black),
                    trackColor: WidgetStatePropertyAll(Colors.white),
                    activeColor: Colors.white,
                    onChanged: (bool value) {
                      // This is called when the user toggles the switch.
                      // setState(() {
                      //light.value != value;
                      // });
                    },
                  ),
                ),
                Text(
                  'Online',
                  style: GoogleFonts.inter(
                      fontSize: 9,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                )
              ],
            ),
          ),
          Icon(
            Icons.person_2_outlined,
            size: 30,
            color: Colors.black,
          ),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
    );
  }

  Widget _buildToggleButton(String text, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
        });
      },
      child: Container(
        alignment: Alignment.center,
        height: getHeight(35),
        width: getWidth(index == 0 ? 84 : 108),
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Color(0xFF4E9376)
              : Colors.white.withOpacity(0.11),
          borderRadius: BorderRadius.all(Radius.circular(getWidth(41))),
        ),
        child: Text(
          text,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            fontSize: getWidth(15),
            height: getHeight(20) / getHeight(15),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
