import 'package:bloc/bloc.dart';
import '../../bloc/stories/stories_event.dart';
import '../../bloc/stories/stories_state.dart';
import '../../models/stories_item.model.dart';
import 'package:flutter/material.dart';

import '../../models/live_events.model.dart';

class StoriesBloc extends Bloc<StoriesEvent, StoriesState> {
  StoriesBloc(StoriesState initialState) : super(initialState) {
    on<StoriesInitialEvent>(_onInitialize);
  }
  List<StoriesItemModel> fillStoriesItemList() {
    return [
      StoriesItemModel(
          storyind: "assets/images/story1.jpg",
          storyname: "kunal",
          id: "#sto1"),
      StoriesItemModel(
          storyind: "assets/images/story1.jpg",
          storyname: "kunal",
          id: "#sto1"),
      StoriesItemModel(
          storyind: "assets/images/story1.jpg",
          storyname: "kunal",
          id: "#sto1"),
      StoriesItemModel(
          storyind: "assets/images/story1.jpg",
          storyname: "kunal",
          id: "#sto1"),
      StoriesItemModel(
          storyind: "assets/images/story1.jpg",
          storyname: "kunal",
          id: "#sto1"),
      StoriesItemModel(
          storyind: "assets/images/story1.jpg",
          storyname: "kunal",
          id: "#sto1"),
      StoriesItemModel(
          storyind: "assets/images/story1.jpg",
          storyname: "kunal",
          id: "#sto1"),
      StoriesItemModel(
          storyind: "assets/images/story1.jpg",
          storyname: "kunal",
          id: "#sto1"),
      StoriesItemModel(
          storyind: "assets/images/story1.jpg",
          storyname: "kunal",
          id: "#sto1"),
      StoriesItemModel(
          storyind: "assets/images/story1.jpg",
          storyname: "kunal",
          id: "#sto1"),
      StoriesItemModel(
          storyind: "assets/images/story1.jpg",
          storyname: "kunal",
          id: "#sto1"),
      StoriesItemModel(
          storyind: "assets/images/story1.jpg",
          storyname: "kunal",
          id: "#sto1"),
      StoriesItemModel(
          storyind: "assets/images/story1.jpg",
          storyname: "kunal",
          id: "#sto1"),
      StoriesItemModel(
          storyind: "assets/images/story1.jpg",
          storyname: "kunal",
          id: "#sto1"),
    ];
  }

  List<ListLiveEventsModel> fillListLiveEventsList() {
    return [
      ListLiveEventsModel(
          liveEventName: "Live Event 1",
          liveEventTime: "10:00 AM",
          liveEventImage: "assets/images/live1.jpg",
          liveEventId: "#live1"),
      ListLiveEventsModel(
          liveEventName: "Live Event 1",
          liveEventTime: "10:00 AM",
          liveEventImage: "assets/images/live1.jpg",
          liveEventId: "#live1"),
      ListLiveEventsModel(
          liveEventName: "Live Event 1",
          liveEventTime: "10:00 AM",
          liveEventImage: "assets/images/live1.jpg",
          liveEventId: "#live1"),
      ListLiveEventsModel(
          liveEventName: "Live Event 1",
          liveEventTime: "10:00 AM",
          liveEventImage: "assets/images/live1.jpg",
          liveEventId: "#live1"),
      ListLiveEventsModel(
          liveEventName: "Live Event 1",
          liveEventTime: "10:00 AM",
          liveEventImage: "assets/images/live1.jpg",
          liveEventId: "#live1")
    ];
  }

  _onInitialize(StoriesInitialEvent event, Emitter<StoriesState> emit) async {
    emit(state.copyWith(
      searchController: TextEditingController(),
    ));
    emit(state.copyWith(
        storiesModelObj: state.storiesModelObj?.copyWith(
      storiesItemList: fillStoriesItemList(),
      // LiveEventsList: fillListLiveEventsList()
    )));
  }
}
