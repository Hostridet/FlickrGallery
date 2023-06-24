
class FlickrImage {
  final String id;
  final String title;
  final String secret;
  final String server;
  final int farm;

  FlickrImage({
    required this.id,
    required this.title,
    required this.secret,
    required this.server,
    required this.farm
  });

  factory FlickrImage.fromJson(Map<String, dynamic> json) {
    return FlickrImage(
      id: json['id'] as String,
      title: json['title'] as String,
      secret: json['secret'] as String,
      server: json['server'] as String,
      farm: json['farm'] as int
    );
  }
}