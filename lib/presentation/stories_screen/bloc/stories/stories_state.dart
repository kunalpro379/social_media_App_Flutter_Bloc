import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../models/stories.model.dart';

class StoriesState extends Equatable {
  StoriesState({this.searchController, this.storiesModelObj, this.isLoading});
  TextEditingController? searchController;
  StoriesModel? storiesModelObj;
  bool? isLoading;
  List<Object?> get props => [searchController, storiesModelObj, isLoading];
  StoriesState copyWith({
    TextEditingController? searchController,
    bool? isLoading,
    StoriesModel? storiesModelObj,
  }) {
    return StoriesState(
        searchController: searchController ?? this.searchController,
        storiesModelObj: storiesModelObj ?? this.storiesModelObj,
        isLoading: isLoading ?? this.isLoading);
  }
}
