import 'package:rydleap/core/app_imagese.dart';

class LanguageModel {
  final String icon,title;

  LanguageModel({required this.icon, required this.title});
}


List <LanguageModel>languageItems=[
  LanguageModel(
    icon: AppImagese.uk, 
    title: "English"
    ),
     LanguageModel(
    icon: AppImagese.sapin, 
    title: "Spanish"
    ),
     LanguageModel(
    icon: AppImagese.portugal, 
    title: "Portuguese"
    ),
     LanguageModel(
    icon: AppImagese.franch, 
    title: "French"
    ),
];