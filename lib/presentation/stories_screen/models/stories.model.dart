import 'package:equatable/equatable.dart';
import 'stories_item.model.dart';
import 'live_events.model.dart';

class StoriesModel extends Equatable {
  StoriesModel({
    this.storiesItemList = const [],
    this.listLiveEventsItems = const [],
  });

  final List<StoriesItemModel> storiesItemList;
  final List<ListLiveEventsModel> listLiveEventsItems;

  StoriesModel copyWith({
    List<StoriesItemModel>? storiesItemList,
    List<ListLiveEventsModel>? listLiveEventsItems,
  }) {
    return StoriesModel(
      storiesItemList: storiesItemList ?? this.storiesItemList,
      listLiveEventsItems: listLiveEventsItems ?? this.listLiveEventsItems,
    );
  }

  @override
  List<Object?> get props => [storiesItemList, listLiveEventsItems];
}
