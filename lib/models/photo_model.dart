class Photos {
  final int albumId;
  final String url;
  final int id;
  final String title;
  final String thumbnailUrl;

  Photos({this.albumId, this.url, this.id, this.title, this.thumbnailUrl});

  factory Photos.fromJson(Map<String, dynamic> json) {
    return Photos(
      albumId: json['albumId'] as int,
      url: json['url'] as String,
      id: json['id'] as int,
      title: json['title'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}