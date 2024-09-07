import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/feature/profile/widgets/privacy_settings/privacy_settings_screen.dart';

class SettingsModel {
  final String icon,title;
  final VoidCallback onTap;

  SettingsModel({required this.icon, required this.title,required this.onTap});
}

List <SettingsModel>settingsItems=[
  SettingsModel(
    icon: AppIcons.note, 
    title: "Documents",
    onTap: (){
      print("Documents");
    }
    ),
    SettingsModel(
    icon: AppIcons.carIcon, 
    title: "Vehicel",
    onTap: (){
       print("Vehicel");
    }
    ),
    SettingsModel(
    icon: AppIcons.paymentIcon, 
    title: "Payments",
    onTap: (){
       print("Payments");
    }
    ),
     SettingsModel(
    icon: AppIcons.note, 
    title: "Privacy",
    onTap: (){
       Get.to(PrivacySettingsScreen());
    }
    
    ),
];