import 'package:rydleap/core/app_icons.dart';

class SettingsModel {
  final String icon,title;

  SettingsModel({required this.icon, required this.title});
}

List <SettingsModel>settingsItems=[
  SettingsModel(
    icon: AppIcons.note, 
    title: "Documents"
    ),
    SettingsModel(
    icon: AppIcons.carIcon, 
    title: "Vehicel"
    ),
    SettingsModel(
    icon: AppIcons.paymentIcon, 
    title: "Payments"
    ),
];