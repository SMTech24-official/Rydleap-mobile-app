import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/custom_close_button.dart';
import 'package:rydleap/core/global_widgets/custom_gradient_button.dart';
import 'package:rydleap/core/utility/app_colors.dart';
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
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();
  bool checkPass = false;
  bool isRoutingNumberValid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          "Routing Number needs to br in 8-digits",
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
            CustomAccountTextfield(
              controller: _dobController,
              hinText: "Date of Birth",
              readOnly: true,
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
    _dobController.dispose();
    _addressController.dispose();
    _zipCodeController.dispose();
    super.dispose();
  }
}
