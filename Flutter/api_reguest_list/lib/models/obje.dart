class Obje {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Obje(
      {required this.albumId,
      required this.id,
      required this.title,
      required this.url,
      required this.thumbnailUrl});

  @override
  String toString() {
    return "albumId: " +
        albumId.toString() +
        " id: " +
        id.toString() +
        " title: " +
        title +
        " url: " +
        url +
        " thumbnailUrl: " +
        thumbnailUrl;
  }
}
