class Room {
  Room({
    required this.title,
    required this.caption,
    required this.description,
    required this.image_url,
    required this.images_url,
    required this.lat,
    required this.lng,
  });

  final String title;
  final String caption;
  final String description;
  final String image_url;
  final List<String> images_url;
  final double lat;
  final double lng;

  factory Room.fromJson(Map<String, dynamic> data) {
    final title = data['title'] as String;
    final caption = data['caption'] as String;
    final description = data['description'] as String;
    final image_url = data['image_url'] as String;
    final images_url = new List<String>.from(data['images_url']);
    final lat = data['lat'] as double;
    final lng = data['lng'] as double;

    return Room(
      title: title,
      caption: caption,
      description: description,
      image_url: image_url,
      images_url: images_url,
      lat: lat,
      lng: lng,
    );
  }
}
