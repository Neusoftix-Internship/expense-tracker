
import 'package:flutter/material.dart';
import 'package:project_structure/constants/app_colors.dart';
import 'package:project_structure/constants/app_images.dart';
import 'package:project_structure/constants/app_styling.dart';
import 'package:project_structure/view/screens/Expenses/addscreen.dart';
import 'package:project_structure/view/screens/HomeScreen/Home.dart';
import 'package:project_structure/view/screens/onboarding/onboarding2.dart';
import 'package:project_structure/view/screens/onboarding/onboarding3.dart';
import 'package:project_structure/view/widget/common_image_view_widget.dart';

import '../../widget/Custom_text_widget.dart';

class Onboarding extends StatelessWidget {
  Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: all(context, 15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonImageView(
                imagePath: Assets.imagesIlustration,
                height: 312,
                width: 312,
                fit: BoxFit.contain,
              ),
              SizedBox(height: h(context, 30)),
              CustomText(
                text: 'Get Paid by \nhourly',
                size: 32,
                weight: FontWeight.bold,
                color: kBlackColor,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: h(context, 20)),

              CustomText(
                text:
                    'Become your own money manager \nand make every cent count',
                size: 16,
                color: kGreyColor,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: h(context, 30)),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Onboarding()),
                      );
                    },
                    child: Container(
                      height: h(context, 10),
                      width: w(context, 10),
                      decoration: const BoxDecoration(
                        color: kVioletColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  SizedBox(width: w(context, 5)),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Onboarding2()),
                      );
                    },
                    child: Container(
                      height: h(context, 10),
                      width: w(context, 10),
                      decoration: const BoxDecoration(
                        color: kVioletColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  SizedBox(width: w(context, 5)),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Onboarding3()),
                      );
                    },
                    child: Container(
                      height: h(context, 10),
                      width: w(context, 10),
                      decoration: const BoxDecoration(
                        color: kVioletColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: h(context, 30)),

              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
                child: Container(
                  height: h(context, 56),
                  width: w(context, 343),
                  decoration: BoxDecoration(
                    color: kBlueColor,
                    borderRadius: BorderRadius.circular(h(context, 15)),
                  ),
                  child: Center(
                    child: CustomText(
                      text: 'Signup',
                      size: 24,
                      weight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ),

              SizedBox(height: h(context, 20)),

              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Addscreen()),
                  );
                },
                child: Container(
                  height: h(context, 56),
                  width: w(context, 343),
                  decoration: BoxDecoration(
                    color: kVioletColor,
                    borderRadius: BorderRadius.circular(h(context, 15)),
                  ),
                  child: Center(
                    child: CustomText(
                      text: 'Login',
                      size: 24,
                      weight: FontWeight.bold,
                      color: kBlueColor,
                    ),
                  ),
                ),
              ),

              SizedBox(height: h(context, 20)),
            ],
          ),
        ),
      ),
    );
  }
}
