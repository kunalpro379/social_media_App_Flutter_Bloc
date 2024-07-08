import 'package:connectiva/core/utils/size_utils.dart';
import 'package:connectiva/theme/app_decoration.dart';
import 'package:connectiva/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

class StoriesItemWidget extends StatelessWidget {
  const StoriesItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70.h,
      child: Column(
        children: [
          Container(
              height: 65.adaptSize,
              width: 65.adaptSize,
              padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 3.v),
              decoration: AppDecoration.outlineDeepPurpleA.copyWith(
                borderRadius: BorderRadiusStyle.circleBorder25,
              ),child: CustomImageView(imagePath: storiesModelObj.,),),
        ],
      ),
    );
  }
}
