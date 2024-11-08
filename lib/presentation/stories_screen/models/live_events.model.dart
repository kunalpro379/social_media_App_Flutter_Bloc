import 'package:connectiva/core/utils/image_constant.dart';

class ListLiveEventsModel {
  List<LiveEvent> liveEvents;

  ListLiveEventsModel({required this.liveEvents});
}

class LiveEvent {
  String? liveEvent1;
  String? liveEvent2;
  String? price;
  String? id;

  LiveEvent({
    this.liveEvent1,
    this.liveEvent2,
    this.price,
    this.id,
  }) {
    liveEvent1 = liveEvent1 ?? ImgConstant.img19179x147;
    liveEvent2 = liveEvent2 ?? "LIVE | Event description here";
    price = price ?? "19:00 | Event location";
    id = id ?? "";
  }
}
