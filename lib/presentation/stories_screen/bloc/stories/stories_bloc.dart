import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'stories_event.dart';
import 'stories_state.dart';
import '../../models/stories.model.dart';
import '../../models/stories_item.model.dart';
import '../../models/live_events.model.dart';

class StoriesBloc extends Bloc<StoriesEvent, StoriesState> {
  StoriesBloc(StoriesState initialState) : super(initialState) {
    on<StoriesInitialEvent>(_onStoriesInitialEvent);
  }

  List<StoriesItemModel> fillStoriesItemList() {
    return [
      StoriesItemModel(
          storyind: "assets/images/story1.jpg",
          storyname: "kunal",
          id: "#sto1"), // Make sure each ID is unique
      StoriesItemModel(
          storyind: "assets/images/story2.jpg",
          storyname: "rahul",
          id: "#sto2"), // Example unique ID
      StoriesItemModel(
          storyind: "assets/images/story1.jpg",
          storyname: "kunal",
          id: "#sto1"), // Make sure each ID is unique
      StoriesItemModel(
          storyind: "assets/images/story2.jpg",
          storyname: "rahul",
          id: "#sto2"),
      StoriesItemModel(
          storyind: "assets/images/story1.jpg",
          storyname: "kunal",
          id: "#sto1"), // Make sure each ID is unique
      StoriesItemModel(
          storyind: "assets/images/story2.jpg",
          storyname: "rahul",
          id: "#sto2"),
      StoriesItemModel(
          storyind: "assets/images/story1.jpg",
          storyname: "kunal",
          id: "#sto1"), // Make sure each ID is unique
      StoriesItemModel(
          storyind: "assets/images/story2.jpg",
          storyname: "rahul",
          id: "#sto2"),
      StoriesItemModel(
          storyind: "assets/images/story1.jpg",
          storyname: "kunal",
          id: "#sto1"), // Make sure each ID is unique
      StoriesItemModel(
          storyind: "assets/images/story2.jpg",
          storyname: "rahul",
          id: "#sto2"),
      StoriesItemModel(
          storyind: "assets/images/story1.jpg",
          storyname: "kunal",
          id: "#sto1"), // Make sure each ID is unique
      StoriesItemModel(
          storyind: "assets/images/story2.jpg",
          storyname: "rahul",
          id: "#sto2"),
      // Add more items as needed
    ];
  }

  Future<void> _onStoriesInitialEvent(
      StoriesInitialEvent event, Emitter<StoriesState> emit) async {
    emit(state.copyWith(
      searchController: TextEditingController(),
      storiesModelObj: StoriesModel(
        storiesItemList: fillStoriesItemList(),
      ),
    ));
  }
}
