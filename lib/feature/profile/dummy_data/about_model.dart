import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/feature/auth/presentaion/screens/change_password.dart';
import 'package:rydleap/feature/profile/widgets/contact_support/contact_support.dart';
import 'package:rydleap/feature/profile/widgets/language/language_screen.dart';
import 'package:rydleap/feature/profile/widgets/notifcation/notification_screen.dart';
import 'package:rydleap/feature/profile/widgets/promotion_offers/promotion_offers.dart';
import 'package:rydleap/feature/profile/widgets/report_problem/report_problem.dart';
import 'package:rydleap/feature/profile/widgets/ride_history/ride_history.dart';
import 'package:rydleap/feature/profile/widgets/settings/settings_screen.dart';

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
        Get.to(SettingsScreen());
      }),
  AboutModel(
      title: "Promotions and offers",
      icon: AppIcons.promotion,
      onTap: () {
        Get.to(PromotionOffersScreen());
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
        Get.to(LanguageScreen());
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
         Get.to(SettingsScreen());
      }),

  AboutModel(
      title: "Change Password",
      icon: AppIcons.key,
      onTap: () {
       Get.to(ChangePasswordScreen());
      }),
  AboutModel(
      title: "Notifications",
      icon: AppIcons.notification,
      onTap: () {
       Get.to(NotificationScreen());
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
       Get.to(LanguageScreen());
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
