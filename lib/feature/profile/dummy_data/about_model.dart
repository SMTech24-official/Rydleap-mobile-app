import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/feature/auth/presentaion/screens/change_password.dart';
import 'package:rydleap/feature/profile/screen/profile_settings.dart';
import 'package:rydleap/feature/profile/widgets/contact_support/contact_support.dart';
import 'package:rydleap/feature/profile/widgets/report_problem/report_problem.dart';
import 'package:rydleap/feature/profile/widgets/ride_history/ride_history.dart';

class AboutModel {
  final String title;
  final String icon;
  final VoidCallback onTap;

  AboutModel({required this.title, required this.icon, required this.onTap});
}


//userItems
List<AboutModel> userItems = [
  AboutModel(
      title: "Settings",
      icon: AppIcons.settings,
      onTap: () {
        // Get.to(ProfileSettings());
      }),
  AboutModel(
      title: "Promotions and offers",
      icon: AppIcons.promotion,
      onTap: () {
        print("Promotions and offers");
      }),
  AboutModel(
      title: "Change Password",
      icon: AppIcons.key,
      onTap: () {
        Get.to(ChangePasswordScreen());
      }),
  AboutModel(
      title: "Payment Methods",
      icon: AppIcons.payment,
      onTap: () {
        print("Payment Methods");
      }),
  AboutModel(
      title: "Ride History",
      icon: AppIcons.history,
      onTap: () {
        Get.to(RideHistoryScreen());
      }),
  AboutModel(
      title: "Language",
      icon: AppIcons.language,
      onTap: () {
        print("Language");
      }),
  AboutModel(
      title: "Report a Problem",
      icon: AppIcons.report,
      onTap: () {
        Get.to(ReportProblemScreen());
      }),
  AboutModel(
      title: "Contact us",
      icon: AppIcons.contact,
      onTap: () {
        Get.to(ContactSupportScreen());
      }),
];


//driverItems
List<AboutModel> driverItems = [
  AboutModel(
      title: "Settings",
      icon: AppIcons.settings,
      onTap: () {
        // Get.to(ProfileSettings());
      }),

  AboutModel(
      title: "Change Password",
      icon: AppIcons.key,
      onTap: () {
       Get.to(ChangePasswordScreen());
      }),
  AboutModel(
      title: "Notifications",
      icon: AppIcons.payment,
      onTap: () {
        print("Notifications");
      }),
  AboutModel(
      title: "Drive History",
      icon: AppIcons.history,
      onTap: () {
        Get.to(RideHistoryScreen());
      }),
  AboutModel(
      title: "Language",
      icon: AppIcons.language,
      onTap: () {
        print("Language");
      }),
  AboutModel(
      title: "Report a Problem",
      icon: AppIcons.report,
      onTap: () {
        Get.to(ReportProblemScreen());
      }),
  AboutModel(
      title: "Contact us",
      icon: AppIcons.contact,
      onTap: () {
        Get.to(ContactSupportScreen());
      }),
];
