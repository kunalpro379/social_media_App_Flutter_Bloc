import 'package:connectiva/core/utils/image_constant.dart';
import 'package:connectiva/core/utils/size_utils.dart';
import 'package:connectiva/presentation/stories_screen/models/live_events.model.dart';
import 'package:connectiva/theme/custom_text_style.dart';
import 'package:connectiva/widgets/CustomElevatedButton/custom_elevatedBtn.dart';
import 'package:connectiva/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

class ListLiveEventsItemWidget extends StatelessWidget {
  final LiveEvent liveEvent;

  ListLiveEventsItemWidget(this.liveEvent, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 145.v,
            width: 150.h,
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                CustomImageView(
                  imagePath: liveEvent.liveEvent1!,
                  height: 145.v,
                  width: 150.h,
                  radius: BorderRadius.circular(10.h),
                  alignment: Alignment.center,
                ),
                CustomElevatedButton(
                  height: 20.v,
                  width: 55.h,
                  text: "Live",
                  margin: EdgeInsets.only(left: 12.h, top: 12.v),
                  leftIcon: Container(
                    margin: EdgeInsets.only(right: 4.h),
                    child: CustomImageView(
                      imagePath: ImgConstant.imgGroup,
                      height: 13.v,
                      width: 13.h,
                    ),
                  ),
                  buttonTextStyle: CustomTextStyles.labelMediumPrimary,
                  alignment: Alignment.topLeft,
                ),
              ],
            ),
          ),
          SizedBox(height: 18.v),
          Text(
            liveEvent.liveEvent2!,
            style: CustomTextStyles.titleSmallBlack90001,
          ),
          SizedBox(height: 6.v),
          Text(
            liveEvent.price!,
            style: CustomTextStyles.labelLargeBluegray400,
          ),
        ],
      ),
    );
  }
}

class ListLiveEvents extends StatelessWidget {
  final ListLiveEventsModel listLiveEventsModel;

  ListLiveEvents({required this.listLiveEventsModel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: listLiveEventsModel.liveEvents.map((event) {
          return Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: ListLiveEventsItemWidget(event),
          );
        }).toList(),
      ),
    );
  }
}
