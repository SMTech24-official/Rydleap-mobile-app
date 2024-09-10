import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/custom_close_button.dart';
import 'package:rydleap/core/global_widgets/custom_gradient_button.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/feature/auth/dirver_registration/components/driver_insurance.dart';
import 'package:rydleap/feature/profile/widgets/balance/components/custom_account_textfield.dart';

class AddAccountScreen extends StatefulWidget {
  const AddAccountScreen({super.key});

  @override
  State<AddAccountScreen> createState() => _AddAccountScreenState();
}

class _AddAccountScreenState extends State<AddAccountScreen> {
  final TextEditingController _accountHolderController =
      TextEditingController();
  final TextEditingController _routingNumberController =
      TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();
  bool checkPass = false;
  bool isRoutingNumberValid = true;
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Color(0xff3AD896),
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
            dialogBackgroundColor: Colors.white,
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  // primary: Color(0xff3AD896),
                  ),
            ),
            colorScheme: ColorScheme.light(
              primary: Color(0xff3AD896),
              onPrimary: Colors.white,
              surface: AppColors.appbarColor,
              onSurface: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.appbarColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.appbarColor,
        leading: CustomCloseButton(),
        title: Text(
          "Add a Bank Account",
          style: GoogleFonts.inter(
              fontSize: getWidth(20), fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
        child: Column(
          children: [
            SizedBox(height: getHeight(37)),
            CustomAccountTextfield(
              controller: _accountHolderController,
              hinText: "Account Holder",
            ),
            SizedBox(height: getHeight(24)),
            CustomAccountTextfield(
              controller: _routingNumberController,
              hinText: "Routing Number",
              borderColor: isRoutingNumberValid
                  ? Colors.white
                  : Colors.red, // Change border color based on validation
            ),
            isRoutingNumberValid
                ? SizedBox(height: getHeight(24))
                : Padding(
                    padding: EdgeInsets.symmetric(vertical: getHeight(5)),
                    child: Row(
                      children: [
                        Image.asset(AppIcons.errorWhiteOutline),
                        SizedBox(
                          width: getWidth(8),
                        ),
                        Text(
                          "Routing Number needs to be in 8 digits",
                          style: GoogleFonts.nunito(
                              fontSize: getWidth(8),
                              fontWeight: FontWeight.w400,
                              color: Color(0xffC7BDBD)),
                        )
                      ],
                    ),
                  ),
            CustomAccountTextfield(
              controller: _accountNumberController,
              hinText: "Bank Account Number",
              obscureText: checkPass,
              suffixIcon: InkWell(
                onTap: () {
                  setState(() {
                    checkPass = !checkPass;
                  });
                },
                child: SizedBox(
                  height: getHeight(24),
                  width: getWidth(24),
                  child: Icon(
                    checkPass ? Icons.visibility_off : Icons.visibility,
                    color: Color(0xffF8F8F8),
                  ),
                ),
              ),
            ),
            SizedBox(height: getHeight(24)),
            InkWell(
              onTap: () {
                _selectDate(context);
              },
              child: Container(
                height: getHeight(41),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: _selectedDate == null
                      ? Colors.transparent
                      : Colors.white.withOpacity(0.5),
                  border: Border.all(color: Colors.white, width: 0.6),
                  borderRadius: BorderRadius.circular(getWidth(8)),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.only(left: getWidth(15), top: getHeight(10)),
                  child: Text(
                    _selectedDate == null
                        ? 'Date of Birth'
                        : _selectedDate!.toLocal().toString().split(' ')[0],
                    style: GoogleFonts.nunito(
                      fontSize: getWidth(15),
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffDCDCDC),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: getHeight(24)),
            CustomAccountTextfield(
              controller: _addressController,
              hinText: "Address",
            ),
            SizedBox(height: getHeight(24)),
            CustomAccountTextfield(
              controller: _zipCodeController,
              hinText: "Zipcode",
              keyboardType: TextInputType.number,
            ),
            Spacer(),
            CustomGradientButton(
              text: "Submit",
              onTap: () {
                _customBottomSheet(context);
                setState(() {
                  isRoutingNumberValid =
                      _routingNumberController.text.length >= 8;
                });
                if (!isRoutingNumberValid) {
                  print("Error: Routing number is too short.");
                } else {
                  print("Success");
                }
              },
            ),
            SizedBox(height: getHeight(20)),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _accountHolderController.dispose();
    _routingNumberController.dispose();
    _accountNumberController.dispose();
    _addressController.dispose();
    _zipCodeController.dispose();
    super.dispose();
  }
 Future<dynamic> _customBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Make the bottom sheet take the full screen
      backgroundColor: Colors.transparent, // Transparent background
      barrierColor: Color(
          0xff001B26).withOpacity(0.8), // Semi-transparent black background for the barrier
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.center, // Center the container on the screen
          child: Stack(
            children: [
              Container(
                height: screenHeight(),
                width: double.infinity,
                color: Colors.transparent,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: getWidth(38)),
                  height: getHeight(281),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        // height: getHeight(120),
                        width: getWidth(95),
                        child: Image.asset(AppImagese.successIcon),
                      ),
                      SizedBox(height: getHeight(12),),
                      Text(
                        ' Your Bank Account has been successfully linked.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                          color: Color(0xff001B26),
                          fontSize: getWidth(17),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: getHeight(36),),
                      InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child: Container(
                              height: getHeight(40),
                              width: getWidth(104),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(88),
                                  color: Color(0xff3AD896)),
                              child: Center(
                                child: Text(
                                  "Done",
                                  style: GoogleFonts.inter(
                                      fontSize: getWidth(14),
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top:
                    getHeight(40), // Adjust the top margin for the close button
                right: getWidth(
                    20), // Adjust the right margin for the close button
                child: SizedBox(
                  height: getHeight(26),
                  width: getWidth(26),
                  child: IconButton(
                    icon: Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

}
