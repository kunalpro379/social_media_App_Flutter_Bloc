import 'package:connectiva/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../../widgets/appbars/custom_appbar.dart';
import 'bloc/stories/stories_bloc.dart';
import 'bloc/stories/stories_state.dart';
import 'models/stories.model.dart';
import 'models/stories_item.model.dart';

class StoriesScreen extends StatelessWidget {
  const StoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(vertical: 26.v),
        child: Stack(
          children: [
            buildUpperBar(),
            Column(
              children: [
                SizedBox(height: 80.v),
                _buildStories(context),
                SizedBox(height: 20.v),
                SizedBox(height: 20.v),
                SizedBox(height: 5.v),
              ],
            )
          ],
        ),
      ),
    );
  }
}

PreferredSizeWidget buildUpperBar() {
  return PreferredSize(
    preferredSize: Size.fromHeight(150.0),
    child: Container(
      height: 200.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 115, 0, 255),
            Color.fromARGB(255, 255, 255, 255),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      /*
      child: Column(
        children: [
          Text(BlocSelector<StoriesBloc, StoriesState, TextEditingController?>(
            selector: (state) {
              return state.searchController;
            },
            builder: (context, SearchController) {
              return Container(
                  height: 50.v,
                  margin: EdgeInsets.symmetric(horizontal: 17.h),
                  child: TextField(
                    controller: SearchController,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ));
            },
          ))
        ],
      ),
      */
    ),
  );
}

Widget _buildStories(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Stories",
          style: TextStyle(
            fontSize: 24, // Increased font size for better visibility
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(
                255, 255, 255, 255), // Changed to black for better contrast
          ),
        ),
        SizedBox(height: 20.v),
        SizedBox(
            height: 90.v,
            child: BlocSelector<StoriesBloc, StoriesState, StoriesModel?>(
              selector: (state) => state.storiesModelObj,
              builder: (
                context,
                storiesModelObj,
              ) {
                return ListView.separated(
                  padding: EdgeInsets.only(right: 14.h),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    StoriesItemModel model =
                        storiesModelObj?.storiesItemList[index] ??
                            StoriesItemModel();
                    return StoriesItemWidget(RenderPhysicalModel);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 10.h,
                    );
                  },
                  itemCount: storiesModelObj?.storiesItemList.length ?? 0,
                );
              },
            ))
      ],
    ),
  );
}
