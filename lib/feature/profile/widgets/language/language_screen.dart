import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/share_pref/share_pref.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/feature/profile/widgets/language/dummy_data/language_model.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  int selectedIndex = 0;
  String _selectedLanguage = "English"; // Default selected language
  String _selectedFlag = "🇺🇸";

  final Map<String, int> languageIndexMap = {
    "English": 0,
    "Bengali": 1,
    "Spanish": 2,
    "Portuguese": 3,
    "French": 4,
  };

  @override
  void initState() {
    super.initState();
    _loadSavedLanguage();
    _loadSavedIndex(); // Load the saved index
  }

  Future<void> _loadSavedIndex() async {
    int savedIndex = await SharePref.getSelectedIndex();
    setState(() {
      selectedIndex = savedIndex;
    });
  }

  Future<void> _changeLanguage(
      Locale locale, String languageName, String flag) async {
    await SharePref.saveSelectedLanguage(locale); // Save selected language
    await SharePref.saveSelectedIndex(selectedIndex); // Save selected index
    print("Language saved: ${locale.languageCode}"); // Debug print
    Get.updateLocale(locale); // Update the app's locale
    setState(() {
      _selectedLanguage = languageName;
      _selectedFlag = flag;
    });
  }

  Future<void> _loadSavedLanguage() async {
    Locale savedLocale = await SharePref.getSelectedLanguage();

    if (savedLocale.languageCode == 'bn') {
      _selectedLanguage = "Bengali";
      _selectedFlag = "🇧🇩";
      selectedIndex = languageIndexMap["Bengali"]!;
    } else if (savedLocale.languageCode == 'es') {
      _selectedLanguage = "Spanish";
      _selectedFlag = "🇪🇸";
      selectedIndex = languageIndexMap["Spanish"]!;
    } else if (savedLocale.languageCode == 'pt') {
      _selectedLanguage = "Portuguese";
      _selectedFlag = "🇧🇷";
      selectedIndex = languageIndexMap["Portuguese"]!;
    } else if (savedLocale.languageCode == 'fr') {
      _selectedLanguage = "French";
      _selectedFlag = "🇫🇷";
      selectedIndex = languageIndexMap["French"]!;
    } else {
      _selectedLanguage = "English"; // Default to English
      _selectedFlag = "🇺🇸"; // Default flag
      selectedIndex = languageIndexMap["English"]!;
    }

    // Update locale with saved language
    Get.updateLocale(savedLocale);
    setState(() {}); // Call setState to refresh the UI
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textBlack,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.appbarColor,
        title: Text(
          "language".tr,
          style: GoogleFonts.inter(
            fontSize: getWidth(20),
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close, size: 20),
        ),
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
          Column(
            children: [
              // Selected Language Display
              Padding(
                padding: EdgeInsets.symmetric(vertical: getHeight(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Selected Language: $_selectedLanguage $_selectedFlag",
                      style: GoogleFonts.nunito(
                        fontSize: getWidth(16),
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(top: getHeight(39.5)),
                  itemCount: languageItems.length,
                  itemBuilder: (context, index) {
                    final data = languageItems[index];
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                        // Change language based on selection
                        Locale locale;
                        switch (data.title) {
                          case "Bengali":
                            locale =
                                Locale('bn', 'BN'); // Match with LocalString
                            _changeLanguage(locale, "Bengali", "🇧🇩");
                            break;
                          case "Spanish":
                            locale =
                                Locale('es', 'ES'); // Match with LocalString
                            _changeLanguage(locale, "Spanish", "🇪🇸");
                            break;
                          case "Portuguese":
                            locale =
                                Locale('pt', 'PT'); // Match with LocalString
                            _changeLanguage(locale, "Portuguese", "🇧🇷");
                            break;
                          case "French":
                            locale =
                                Locale('fr', 'FR'); // Match with LocalString
                            _changeLanguage(locale, "French", "🇫🇷");
                            break;
                          default: // Default to English
                            locale =
                                Locale('en', 'US'); // Match with LocalString
                            _changeLanguage(locale, "English", "🇺🇸");
                        }

                        print("Selected Language: ${data.title}");
                      },
                      child: Padding(
                        padding: EdgeInsets.only(bottom: getHeight(14.5)),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: getWidth(15)),
                          margin:
                              EdgeInsets.symmetric(horizontal: getWidth(15)),
                          height: getHeight(51),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: selectedIndex == index
                                    ? Colors.transparent
                                    : Color(0xff6D6A6A),
                              ),
                            ),
                            color: selectedIndex == index
                                ? Colors.white.withOpacity(0.3)
                                : Colors.transparent,
                            borderRadius: selectedIndex == index
                                ? BorderRadius.circular(10)
                                : BorderRadius.circular(0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: getHeight(40),
                                    width: getWidth(25),
                                    child: Image.asset(data.icon),
                                  ),
                                  SizedBox(width: getWidth(24.5)),
                                  Text(
                                    data.title,
                                    style: GoogleFonts.nunito(
                                      fontSize: getWidth(16),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: getHeight(22),
                                width: getWidth(22),
                                child: selectedIndex == index
                                    ? Image.asset(AppIcons.checkFill)
                                    : SizedBox(),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
