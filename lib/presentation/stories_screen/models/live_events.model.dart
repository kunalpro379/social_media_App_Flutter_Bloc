import 'package:flutter/material.dart';

class ListLiveEventsModel {
  ListLiveEventsModel(
      {this.LiveEventImage,
      this.id,
      this.LiveEventName,
      this.LiveEventTime,
      this.price, required String liveEventName, required String liveEventTime, required String liveEventId, required String liveEventImage}) {
    LiveEventImage = LiveEventImage ??
        Image(image: AssetImage("assets/images/cricket_event.webp"));
    LiveEventName = LiveEventName ?? "Live Event 1";
    LiveEventTime = LiveEventTime ?? "10:00 AM";
    price = price ?? "Free to Join";
    id = id ?? "#live";
  }
  String? id;
  Image? LiveEventImage;
  String? LiveEventName;
  String? LiveEventTime;
  String? price;
}
