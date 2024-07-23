import 'package:connectiva/core/utils/image_constant.dart';
import 'package:connectiva/core/utils/size_utils.dart';
import 'package:connectiva/global_classes/like_button/like_bloc.dart';
import 'package:connectiva/presentation/stories_screen/bloc/stories/stories_event.dart';
import 'package:connectiva/presentation/stories_screen/models/live_events.model.dart';
import 'package:connectiva/presentation/stories_screen/widgets/ListLiveEvents.dart';
import 'package:connectiva/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../core/utils/imageconstants.dart';
import '../../global_classes/Image_Grid.dart';
import '../../global_classes/like_button/like_event.dart';
import '../../global_classes/like_button/like_state.dart';
import '../../theme/theme_helper.dart';
import 'bloc/live_events/event.bloc.dart';
import 'bloc/live_events/event.event.dart';
import 'bloc/live_events/event.state.dart';
import 'bloc/stories/stories_bloc.dart';
import 'bloc/stories/stories_state.dart';
import 'models/stories.model.dart';
import 'models/stories_item.model.dart';
import 'utils/event_cards.dart';
import 'widgets/stories_item.wid.dart';

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
        // BlocProvider(
        //   create: (context) => LikeBloc(),
        // ),
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
            Positioned.fill(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 4.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        color: Colors.white,
                      ),
                      MorningBuzz(),
                      SizedBox(height: 20.v),
                      Text(
                        "Status",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20.v),
                      BlocBuilder<StoriesBloc, StoriesState>(
                        builder: (context, state) {
                          if (state.storiesModelObj == null) {
                            return Center(child: CircularProgressIndicator());
                          }
                          return SizedBox(
                            height: 150.v,
                            child: ListView.separated(
                              padding: EdgeInsets.only(right: 14.h),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                StoriesItemModel model = state
                                    .storiesModelObj!.storiesItemList[index];
                                return StoriesItemWidget(model);
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(width: 10.h);
                              },
                              itemCount:
                                  state.storiesModelObj!.storiesItemList.length,
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 20.v),
                      //  BuildEvents(),
                      BlocProvider(
                        create: (context) => EventBloc()..add(LoadEvents()),
                        child: EventList(),
                      ),
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
                    //  BlocBuilder<LikeBloc, LikeState>(
                    //    builder: (context, state) {
                    //      bool isLiked = state.isLiked;

                    //GestureDetector(
                    // onTap: () {
                    //   BlocProvider.of<LikeBloc>(context)
                    //       .add(LikeButtonPressed(!isLiked));
                    // },
                    // child: Container(
                    //   padding: EdgeInsets.all(8.0),
                    //   decoration: BoxDecoration(
                    //     color: isLiked ? Colors.blue : Colors.grey,
                    //     shape: BoxShape.circle,
                    //   ),
                    //       child: Icon(
                    //         isLiked
                    //             ? Icons.thumb_up
                    //             : Icons.thumb_up_outlined,
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //   );
                    // },
                    //),
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

class BuildEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Events",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(height: 15.v),
          SizedBox(
            height: 250.v,
            child: BlocBuilder<EventBloc, EventState>(
              builder: (context, state) {
                if (state is EventInitial) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is EventsLoaded) {
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final model = state.events[index];
                      return Container(
                        width: 250, // Set a fixed width for each card
                        child: EventList(),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 16.h);
                    },
                    itemCount: state.events.length,
                  );
                } else if (state is EventLoadError) {
                  return Center(
                      child: Text('Failed to load events: ${state.message}'));
                } else {
                  return Center(child: Text('Unexpected state'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
