class Event {
  final String id;
  final String title;
  final String venue;
  final String time;
  final String thumbnailUrl;
  final bool isLive;

  Event({
    required this.id,
    required this.title,
    required this.venue,
    required this.time,
    required this.thumbnailUrl,
    required this.isLive,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      title: json['title'],
      venue: json['venue'],
      time: json['time'],
      thumbnailUrl: json['thumbnailUrl'],
      isLive: json['isLive'],
    );
  }
}
