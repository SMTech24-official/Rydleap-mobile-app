import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/custom_buttomsheet/bottomsheet_onebutton.dart';
import 'package:rydleap/core/global_widgets/global_variable.dart';

class CustomPrivacyDropdown extends StatefulWidget {
  const CustomPrivacyDropdown({super.key});

  @override
  State<CustomPrivacyDropdown> createState() => _CustomPrivacyDropdownState();
}

class _CustomPrivacyDropdownState extends State<CustomPrivacyDropdown> {
  bool _isExpanded = false;
  String _selectedOption = "Only me"; // Default selected option

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: getHeight(5),
      
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.02),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: getWidth(10)),
                child: Text(
                  "ride_history".tr,
                  style: GoogleFonts.nunito(
                      fontSize: getWidth(16), fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Text(_selectedOption, style: GoogleFonts.nunito(
                      color: Color(0xff3AD896),
                    fontSize: getWidth(16), fontWeight: FontWeight.w400),), // Display the selected option
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _isExpanded = !_isExpanded;
                        });
                      },
                      icon: _isExpanded
                          ? Icon(Icons.arrow_drop_down)
                          : Icon(Icons.arrow_drop_up)
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          if (_isExpanded)
            Container(
              // margin: EdgeInsets.symmetric(horizontal: getWidth(20)),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.08),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Container(
                       decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.02),
                borderRadius: BorderRadius.circular(10),
              ),
                    child: ListTile(
                      title: Text("Only me", style: GoogleFonts.nunito(
                        
                      fontSize: getWidth(16), fontWeight: FontWeight.w400),),
                      trailing: _selectedOption == "Only me"
                          ? Image.asset(AppIcons.checkFill)
                          : Image.asset(AppIcons.checkGrey),
                      onTap: () {
                        setState(() {
                          _selectedOption = "Only me";
                          _isExpanded = false; // Close dropdown after selection
                        });
                      },
                    ),
                  ),
                CustomGlobalVariable.userType == 'Driver'
                    ?SizedBox():  SizedBox(height: getHeight(12),),
               CustomGlobalVariable.userType == 'Driver'
                    ?SizedBox(): Container(
                       decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.02),
                borderRadius: BorderRadius.circular(10),
              ),
                    child: ListTile(
                      title: Text("Friends"),
                      trailing: _selectedOption == "Friends"
                          ? Image.asset(AppIcons.checkFill)
                          : Image.asset(AppIcons.checkGrey),
                      onTap: () {
                        setState(() {
                          _selectedOption = "Friends";
                          _isExpanded = false;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: getHeight(12),),
                  Container(
                       decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.02),
                borderRadius: BorderRadius.circular(10),
              ),
                    child: ListTile(
                      title: Text("Public"),
                      trailing: _selectedOption == "Public"
                          ? Image.asset(AppIcons.checkFill)
                          : Image.asset(AppIcons.checkGrey),
                      onTap: () {
                        setState(() {
                          _selectedOption = "Public";
                          _isExpanded = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
