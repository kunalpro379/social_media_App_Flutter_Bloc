import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../models/stories.model.dart';

class StoriesState extends Equatable {
  final TextEditingController? searchController;
  final StoriesModel? storiesModelObj;
  final bool? isLoading;

  StoriesState({
    this.searchController,
    this.storiesModelObj,
    this.isLoading,
  });

  @override
  List<Object?> get props => [searchController, storiesModelObj, isLoading];

  StoriesState copyWith({
    TextEditingController? searchController,
    bool? isLoading,
    StoriesModel? storiesModelObj,
  }) {
    return StoriesState(
      searchController: searchController ?? this.searchController,
      storiesModelObj: storiesModelObj ?? this.storiesModelObj,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
