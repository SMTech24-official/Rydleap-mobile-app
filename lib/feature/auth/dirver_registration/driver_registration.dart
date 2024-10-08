import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/custom_close_button.dart';
import 'package:rydleap/core/global_widgets/custom_gradient_button.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/feature/auth/dirver_registration/components/driver_licence.dart';
import 'package:rydleap/feature/auth/dirver_registration/components/driver_textfield.dart';

class DriverRegistrationScreen extends StatefulWidget {
  const DriverRegistrationScreen({super.key});

  @override
  State<DriverRegistrationScreen> createState() => _DriverRegistrationScreenState();
}

class _DriverRegistrationScreenState extends State<DriverRegistrationScreen> {
      final TextEditingController _vehicleController = TextEditingController();
    final TextEditingController _modelController = TextEditingController();
    final TextEditingController _yearController = TextEditingController();
    final TextEditingController _colorController = TextEditingController();
    final TextEditingController _licenceController = TextEditingController();
  bool isModelValid = true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.appbarColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.appbarColor,
        title: Text(
          "Driver Registration",
          style: GoogleFonts.inter(
            fontSize: getWidth(20),
            fontWeight: FontWeight.w600,
          ),
        ),
        leading:CustomCloseButton()
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getHeight(32),
            ),
            Text(
              "Add your vehicle",
              style: GoogleFonts.inter(
                  fontSize: getWidth(25), fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: getHeight(8),
            ),
            Text(
              "Your vehicle must be 2005 or newer and at least 4 doors and not salvaged.",
              style: GoogleFonts.nunito(
                  color: Color(0xffE1E1E1),
                  fontSize: getWidth(12),
                  fontWeight: FontWeight.w400),
            ),
             SizedBox(
              height: getHeight(38),
            ),
            // DriverTextfield(
            //   controller: _vehicleController,
            //   hintext: "Make",
            //   ),
            DriverTextfield(
              controller: _vehicleController,
              hintext: "Routing Number",
              borderColor: isModelValid
                  ? Color(0xff6D6A6A)
                  : Colors.red, // Change border color based on validation
            ),
            SizedBox(
              height: getHeight(5),
            ),
            Padding(
              padding: EdgeInsets.only(left: getWidth(15)),
              child: Text(
                "e.g Audi",
                style: GoogleFonts.nunito(
                    color: Color(0xffC7BDBD),
                    fontSize: getWidth(8),
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: getHeight(8),
            ),
            DriverTextfield(controller: _modelController, hintext: "Model",),
            SizedBox(
              height: getHeight(5),
            ),
            Padding(
              padding: EdgeInsets.only(left: getWidth(15)),
              child: Text(
                "e.g S4 Avant",
                style: GoogleFonts.nunito(
                    color: Color(0xffC7BDBD),
                    fontSize: getWidth(8),
                    fontWeight: FontWeight.w400),
              ),
            ),
             SizedBox(
              height: getHeight(5),
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                   
                    
                    child: DriverTextfield(controller: _yearController, hintext: "Year",),
                  ),
                ),
                 SizedBox(
              width: getWidth(33),
            ),
            Expanded(
              child: SizedBox(
                  
                    
                    child: DriverTextfield(controller: _colorController, hintext: "Color",),
                  ),
            ),
              ],
            ),
            SizedBox(height: getHeight(24),),
            DriverTextfield(controller: _licenceController, hintext: "Licence Plate Number",),
            Spacer(),
            CustomGradientButton(text: "Continue", onTap: (){
                setState(() {
                  isModelValid = _vehicleController.text.isNotEmpty;
                });

                if (!isModelValid) {
                  print("Vehicle is required");
                } else {
                
                  Get.to(DriverLicence());
                }
            }),
            SizedBox(height: getHeight(20),)

          ],
        ),
      ),
    );
  }
}
