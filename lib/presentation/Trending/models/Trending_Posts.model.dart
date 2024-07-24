import 'package:equatable/equatable.dart';

import 'post_item_model.dart';

class TrendingPostsModel extends Equatable {
  TrendingPostsModel({this.postItemList = const []});
  List<PostItemModel> postItemList;
  TrendingPostsModel copyWith({List<PostItemModel>? postItemList}) {
    return TrendingPostsModel(postItemList: postItemList ?? this.postItemList);
  }

  List<Object?> get props => [postItemList];
}
