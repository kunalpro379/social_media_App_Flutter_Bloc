import 'package:connectiva/core/utils/size_utils.dart';
import 'package:connectiva/presentation/stories_screen/models/stories_item.model.dart';
import 'package:connectiva/theme/app_decoration.dart';
import 'package:connectiva/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoriesItemWidget extends StatelessWidget {
  StoriesItemWidget(this.storiesItemModelObj, {Key? key}) : super(key: key);
  StoriesItemModel storiesItemModelObj;
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
            ),
            child: CustomImageView(
              imagePath: storiesItemModelObj.storyind,
              height: 55.v,
              width: 52.h,
              radius: BorderRadius.circular(26.h),
              alignment: Alignment.center,
            ),
          ),
          SizedBox(height: 5.v),
          Text(
            storiesItemModelObj.storyname!,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
