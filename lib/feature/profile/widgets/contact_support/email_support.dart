import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/custom_buttomsheet/custom_bottomsheet.dart';
import 'package:rydleap/core/global_widgets/custom_close_button.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/feature/profile/controller/profile_controller.dart';

class EmailSupportScreen extends StatefulWidget {
  const EmailSupportScreen({super.key});

  @override
  State<EmailSupportScreen> createState() => _EmailSupportScreenState();
}

class _EmailSupportScreenState extends State<EmailSupportScreen> {

  ProfileController profileController=Get.find();




  final TextEditingController _issueController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  File? _selectedImage;

  final ImagePicker _picker = ImagePicker();

  final String _imageKey = "stored_image_path";

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(source: source);
      if (image != null) {
        setState(() {
          _selectedImage = File(image.path);
        });
        // _storeImagePath(image.path);
      }
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<bool> _checkPermissions(ImageSource source) async {
    if (source == ImageSource.camera) {
      final cameraStatus = await Permission.camera.status;
      if (cameraStatus.isGranted) {
        final result = await Permission.camera.request();
        return result.isGranted;
      }
    } else if (source == ImageSource.gallery) {
      final storageStatus = await Permission.photos.request();
      if (storageStatus.isGranted) {
        final result = await Permission.photos.request();
        return result.isGranted;
      }
    }
    return true;
  }

  void _showImageSourceSelection(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.appbarColor,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Take a Photo'),
              onTap: () async {
                if (await _checkPermissions(ImageSource.gallery)) {
                  _pickImage(ImageSource.camera);
                }

                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Choose from Gallery'),
              onTap: () async {
                if (await _checkPermissions(ImageSource.gallery)) {
                  _pickImage(ImageSource.gallery);
                }

                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textBlack,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.appbarColor,
        centerTitle: true,
        title: Text(
          "Email Support",
          style: GoogleFonts.inter(
              fontSize: getWidth(20), fontWeight: FontWeight.w600),
        ),
        leading: CustomCloseButton()
      ),
      body: Stack(
        children: [
          Container(
            height: screenHeight(),
            width: double.infinity,
            color: AppColors.textBlack,
          ),
          Image.asset(
            'assets/images/Ellipse_9.png',
            width: 150.w,
            height: 50.h,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.only(
                top: getHeight(35), left: getWidth(20), right: getWidth(20)),
            child: Column(
              children: [
                //issute type section
                Container(
                  height: getHeight(51),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff6D6A6A), width: 0.6),
                      borderRadius: BorderRadius.circular(getWidth(8))),
                  child: TextField(
                    readOnly: true,
                    keyboardType: TextInputType.number,
                    controller: _issueController,
                    decoration: InputDecoration(
                      hintText: "Issue Type",
                      hintStyle: GoogleFonts.nunito(
                          fontSize: getWidth(15),
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Image.asset(AppIcons.arrowDown)),
                      contentPadding: EdgeInsets.only(
                          bottom: 10.5, left: 15, top: 10.5, right: 15),
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: getHeight(16),
                ),
                //subject section
                Container(
                  height: getHeight(51),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff6D6A6A), width: 0.6),
                      borderRadius: BorderRadius.circular(getWidth(8))),
                  child: TextField(
                    controller: _subjectController,
                    decoration: InputDecoration(
                      hintText: "Subject",
                      hintStyle: GoogleFonts.nunito(
                          fontSize: getWidth(15),
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                      contentPadding: EdgeInsets.only(
                          bottom: 10.5, left: 15, top: 10.5, right: 15),
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: getHeight(30),
                ),
                Container(
                  height: getHeight(141),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: TextField(
                    controller: _descriptionController,
                    maxLines: 7,
                    textAlign: TextAlign.start,
                    style:GoogleFonts.nunito(
                          fontSize: getWidth(14),
                          fontWeight: FontWeight.w400,
                          color: AppColors.textBlack) ,
                    decoration: InputDecoration(
                      hintText: "Tell us more about your problem",

                      hintStyle: GoogleFonts.nunito(
                          fontSize: getWidth(14),
                          fontWeight: FontWeight.w400,
                          color: Color(0xffB6B3B3)),
                      
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: getHeight(20),
                ),
                Text(
                  "You can upload png/jpg/mov",
                  style: GoogleFonts.nunito(
                      fontSize: getWidth(14),
                      fontWeight: FontWeight.w400,
                      color: Color(0xffB6B3B3)),
                ),
                SizedBox(
                  height: getHeight(12),
                ),
                Container(
                  height: getHeight(180),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/frame.png",
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Stack(
                    children: [
                      _selectedImage != null
                          ? ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(8), 
                              child: Container(
                                width: double.infinity, 
                                height: double
                                    .infinity, 
                                child: Image.file(
                                  _selectedImage!,
                                  fit: BoxFit
                                      .cover, 
                                ),
                              ),
                            )
                          : Align(
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: () {
                                  _showImageSourceSelection(context);
                                },
                                child: Container(
                                  height: getHeight(37),
                                  width: getWidth(114),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(51),
                                    color: Color(0xff3AD896),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(AppIcons.upload),
                                      SizedBox(width: getWidth(8)),
                                      Text(
                                        "Upload",
                                        style: GoogleFonts.nunito(
                                          fontSize: getWidth(12),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
                
                Spacer(),
                Material(
                  borderRadius: BorderRadius.circular(getWidth(46)),
                  color: Color(0xff3AD896),
                  child: InkWell(
                    onTap: () {
                      // _customBottomSheet(context);
                      customBottomSheet(context, 
                      "Your support request has been sent.", 
                      AppImagese.successIcon, 
                      "Expected response time: 24 hours", 
                      getWidth(17),
                      getWidth(12)

                      
                      );


                      //profileController.sendEmail('_issueController.text', '_subjectController.text', '_descriptionController.text');




                    },
                    borderRadius: BorderRadius.circular(getWidth(46)),
                    splashColor: Colors.grey.withOpacity(0.5),
                    child: Container(
                      height: getHeight(50),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 0.6),
                        borderRadius: BorderRadius.circular(getWidth(46)),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffFFFFFF).withOpacity(0.2),
                            offset: Offset(0, 1),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: getHeight(22),
                              width: getWidth(22),
                              child: Image.asset(AppIcons.send)),
                          SizedBox(
                            height: getWidth(11),
                          ),
                          Text(
                            "Send",
                            style: GoogleFonts.inter(
                              fontSize: getWidth(17),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: getHeight(20),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

 }
