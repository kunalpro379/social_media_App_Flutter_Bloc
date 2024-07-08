import 'package:connectiva/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
import '../core/utils/image_constant.dart';
import '../theme/theme_helper.dart';
import '../widgets/custom_image_view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme
            .deepPurpleA200, // Ensure appTheme is correctly imported and used
        body: SizedBox(
          width: double.infinity, // Simplified from double.maxFinite
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant
                    .imgSocialMedia1, // Ensure ImageConstant is correctly imported and used
                height: 120
                    .adaptSize, // adaptSize is a custom extension or function for responsive design
                width: 120.adaptSize,
              ),
              SizedBox(
                  height: 20
                      .v), // .v extension for vertical spacing, ensure it’s implemented correctly
              Text(
                "Connectiva",
                style: theme.textTheme
                    .displaySmall, // Ensure theme is correctly imported and used
              ),
              SizedBox(height: 5.v), // Additional spacing below the text
            ],
          ),
        ),
      ),
    );
  }
}
