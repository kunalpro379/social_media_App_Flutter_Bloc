import 'package:connectiva/presentation/Trending/models/Trending_Posts.model.dart';
import 'package:equatable/equatable.dart';

class TrendingPostsState extends Equatable {
  TrendingPostsState({required this.trendingPostsModelObj});
  TrendingPostsModel trendingPostsModelObj;

  List<Object?> get props => [trendingPostsModelObj];
  TrendingPostsState copyWith({TrendingPostsModel? trendingPostsModelObj}) {
    return TrendingPostsState(
        trendingPostsModelObj:
            trendingPostsModelObj ?? this.trendingPostsModelObj);
  }
}
