import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/utils/imageconstants.dart';
import '../global_classes/like_button/like_bloc.dart';
import '../global_classes/like_button/like_event.dart';
import '../global_classes/like_button/like_state.dart';
import 'custom_image_view.dart';

class MorningBuzz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LikeBloc, LikeState>(
      builder: (context, state) {
        bool isLiked = state.isLiked;

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
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      "19 minutes ago",
                      style: TextStyle(
                        color: Color.fromARGB(255, 7, 46, 65),
                      ),
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
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<LikeBloc>(context)
                                .add(LikeButtonPressed(!isLiked));
                          },
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: isLiked ? Colors.blue : Colors.grey,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              isLiked
                                  ? Icons.thumb_up
                                  : Icons.thumb_up_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: 5.0),
                        Text("2200"),
                        SizedBox(width: 20.0),
                        Icon(Icons.comment),
                        SizedBox(width: 5.0),
                        Text("800"),
                        Spacer(),
                        CustomImageView(
                          imagePath: ImageConstant.DefStoryImage,
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
      },
    );
  }
}
