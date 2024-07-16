import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'like_bloc.dart';
import 'like_event.dart';
import 'like_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'like_bloc.dart';
import 'like_event.dart';
import 'like_state.dart';

class CustomLikeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LikeBloc, LikeState>(
      builder: (context, state) {
        bool isLiked = state.isLiked;

        return GestureDetector(
          onTap: () {
            // Toggle the like status
            BlocProvider.of<LikeBloc>(context).add(LikeButtonPressed(!isLiked));
          },
          child: Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: isLiked ? Colors.blue : Colors.grey,
              shape: BoxShape.circle,
            ),
            child: Icon(
              isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
