import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/feature/profile/widgets/language/dummy_data/language_model.dart';


class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
   int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textBlack,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.appbarColor,
        title: Text(
          "Language",
          style: GoogleFonts.inter(
            fontSize: getWidth(20),
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close,size: 20,),
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
          Container(
            child: ListView.builder(
              padding: EdgeInsets.only(top: getHeight(39.5)),
              itemCount: languageItems.length,
              itemBuilder: (context,index){
                final data = languageItems[index];
                return  InkWell(
                  onTap: (){
                    setState(() {
                      selectedIndex=index;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: getHeight(14.5)),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: getWidth(15)),
                      margin: EdgeInsets.symmetric(horizontal: getWidth(15)),
                      height: getHeight(51),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        
                        border: Border(
                            bottom: BorderSide(
                                color:selectedIndex==index?Colors.transparent: 
                                     Color(0xff6D6A6A))),
                        color:selectedIndex==index?Colors.white.withOpacity(0.3): 
                             Colors.transparent,
                        borderRadius:selectedIndex==index?BorderRadius.circular(10):  BorderRadius.circular(0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            
                            children: [
                              SizedBox(height: getHeight(40),
                              width: getWidth(25),
                              child: Image.asset(data.icon,),),
                              SizedBox(width: getWidth(24.5),),
                              Text(
                                data.title,
                                style: GoogleFonts.nunito(
                                    fontSize: getWidth(16),
                                    fontWeight: FontWeight.w400),
                              ),
                              
                            ],
                          ),
                          SizedBox(height: getHeight(22),
                          width: getWidth(22),
                          child:selectedIndex==index? Image.asset(AppIcons.checkFill):SizedBox(),)
                        ],
                      ),
                    ),
                  ),
                );
             
              }
              )
            )
        ],
      ),
    );
  }
}
