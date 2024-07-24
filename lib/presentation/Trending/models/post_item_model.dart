class PostItemModel {
  // Constructor
  PostItemModel({
    required this.name,
    required this.timestamp,
    required this.hashes,
    required this.zipcode,
    required this.id,
  });
  String? name;
  String timestamp;
  List<String> hashes; // Use List<String> if hashes are strings
  String zipcode;
  String id;
  factory PostItemModel.fromJson(Map<String, dynamic> json) {
    return PostItemModel(
        name: json['name'] as String,
        timestamp: json['timestamp'] as String,
        hashes: List<String>.from(json['hashes'] as List),
        zipcode: json['zipcode'] as String,
        id: json['id'] as String);
  }
}
