import 'package:connectiva/presentation/Explore_main_Container/models/explore.model.dart';
import 'package:equatable/equatable.dart';

class ExploreContentState extends Equatable {
  final ExploreContentModel? exploreContentModelObj;

  ExploreContentState({this.exploreContentModelObj});

  @override
  List<Object?> get props => [exploreContentModelObj];

  ExploreContentState copyWith({ExploreContentModel? exploreContentModelObj}) {
    return ExploreContentState(
      exploreContentModelObj:
          exploreContentModelObj ?? this.exploreContentModelObj,
    );
  }
}
