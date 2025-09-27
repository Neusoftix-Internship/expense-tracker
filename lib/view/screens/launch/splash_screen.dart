import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_structure/constants/app_colors.dart';
import 'package:project_structure/constants/app_images.dart';
import 'package:project_structure/view/screens/onboarding/onboarding.dart';
import 'package:project_structure/view/widget/common_image_view_widget.dart';
import '../../widget/Custom_text_widget.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Onboarding()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  kBlueColor,
      body: Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CommonImageView(
        imagePath: Assets.imagesLogo,
        height: 144,
        width: 144,
        fit: BoxFit.contain,
      ),
      CustomText(
        text: 'App',
        size: 56,
        weight: FontWeight.bold,
        color: kPrimaryColor,
      ),
    ],
  ),
),

    );
  }
}
