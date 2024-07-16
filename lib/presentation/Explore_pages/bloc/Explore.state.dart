import 'package:connectiva/presentation/Explore_pages/models/explore.model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ExploreState extends Equatable {
  ExploreState({this.searchController, this.ExploreModelObj});
  TextEditingController? searchController;
  ExploreModel? ExploreModelObj;

  List<Object?> get props => [searchController, ExploreModelObj];

  ExploreState copyWith(
      {TextEditingController? searchController,
      ExploreModel? exploreModelObj}) {
    return ExploreState(
      searchController: searchController ?? this.searchController,
      ExploreModelObj: exploreModelObj ?? this.ExploreModelObj,
    );
  }
}
