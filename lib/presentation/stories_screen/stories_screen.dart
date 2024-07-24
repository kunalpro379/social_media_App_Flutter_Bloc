import 'package:connectiva/core/utils/image_constant.dart';

import 'package:connectiva/presentation/stories_screen/bloc/stories/stories_event.dart';

import 'package:connectiva/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/utils/imageconstants.dart';
import '../../global_classes/Image_Grid.dart';

import 'bloc/live_events/event.bloc.dart';
import 'bloc/live_events/event.event.dart';
import 'bloc/stories/stories_bloc.dart';
import 'bloc/stories/stories_state.dart';
import 'models/stories.model.dart';
import 'models/stories_item.model.dart';
import 'utils/event_cards.dart';
import 'widgets/stories_item.wid.dart';
import 'package:shimmer/shimmer.dart';

class StoriesScreen extends StatelessWidget {
  const StoriesScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              StoriesBloc(StoriesState(storiesModelObj: StoriesModel()))
                ..add(StoriesInitialEvent()),
        ),
        BlocProvider(
          create: (context) => EventBloc()..add(LoadEvents()),
        ),
      ],
      child: StoriesScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/back.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Static Container (e.g., MorningBuzz) - Positioned
            Positioned(
              top: 20, // Adjust as needed
              left: 20, // Adjust as needed
              right: 20, // Optional: Adjust as needed
              child: MorningBuzz(),
            ),
            // Scrollable content
            Positioned.fill(
              top:
                  240, // Adjust this to avoid overlapping with static container
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Status",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      BlocBuilder<StoriesBloc, StoriesState>(
                        builder: (context, state) {
                          if (state.storiesModelObj == null) {
                            //Center(child: CircularProgressIndicator());
                            return Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                height: 150,
                                color: Colors.white,
                              ),
                            );
                          }
                          return SizedBox(
                            height: 150,
                            child: ListView.separated(
                              padding: EdgeInsets.only(right: 14.0),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                StoriesItemModel model = state
                                    .storiesModelObj!.storiesItemList[index];
                                return StoriesItemWidget(model);
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(width: 10.0);
                              },
                              itemCount:
                                  state.storiesModelObj!.storiesItemList.length,
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Live Events",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15),
                      ),
                      SizedBox(height: 10),
                      BlocProvider(
                        create: (context) => EventBloc()..add(LoadEvents()),
                        child: EventList(),
                      ),
                      SizedBox(height: 300), // Add extra space if needed
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MorningBuzz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 22.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Color.fromARGB(147, 169, 169, 169).withOpacity(0.8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.DefStoryImage,
            height: 50.0,
            width: 50.0,
            radius: BorderRadius.circular(25.0),
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dr. Kunal Patil",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5.0),
                Text(
                  "19 minutes ago",
                  style: TextStyle(color: Color.fromARGB(255, 7, 55, 79)),
                ),
                SizedBox(height: 10.0),
                Container(
                  width: double.infinity,
                  child: Text(
                    "Most people never appreciate what he does but instead they see the point of his fault for their own pleasure.",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    SizedBox(width: 5.0),
                    Text("2200"),
                    SizedBox(width: 20.0),
                    Icon(Icons.comment),
                    SizedBox(width: 5.0),
                    Text("800"),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(bottom: 1),
                      child: ImgGrid(imagePaths: [
                        ImgConstant.imgUser,
                        ImageConstant.DefStoryImage,
                        ImgConstant.img19144x147,
                      ]),
                      height: 40.0,
                      width: 40.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
