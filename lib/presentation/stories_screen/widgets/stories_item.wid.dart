import 'package:connectiva/core/utils/size_utils.dart';
import 'package:connectiva/presentation/stories_screen/models/stories_item.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoriesItemWidget extends StatelessWidget {
  StoriesItemWidget(this.storiesItemModelObj, {Key? key}) : super(key: key);

  final StoriesItemModel storiesItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70.h,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Color.fromARGB(255, 91, 116, 255),
                width: 2.0, // Adjust the width as needed
              ),
            ),
            child: CircleAvatar(
              radius: 50.h,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 38.h,
                backgroundColor: Colors.white,
                //  backgroundImage: AssetImage(storiesItemModelObj.storyind),
              ),
            ),
          ),
          SizedBox(height: 2.v),
          Text(
            storiesItemModelObj.storyname!,
            style: TextStyle(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
