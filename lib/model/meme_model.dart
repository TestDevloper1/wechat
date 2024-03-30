
class Meme {
  final int id;
  final String catId;
  final String addedBy;
  final String description;
  final String image;
  final int status;
  final String reason;
  final String dateTime;
  final String totalShare;
  final String totalDownloads;
  final String deactivationReason;
  final String video;
  final String title;
  final String category;
  final String mediaType;
  final String downloads;
  final String thumbnail;

  Meme({
    required this.id,
    required this.catId,
    required this.addedBy,
    required this.description,
    required this.image,
    required this.status,
    required this.reason,
    required this.dateTime,
    required this.totalShare,
    required this.totalDownloads,
    required this.deactivationReason,
    required this.video,
    required this.title,
    required this.category,
    required this.mediaType,
    required this.downloads,
    required this.thumbnail,
  });

  factory Meme.fromJson(Map<String, dynamic> json) {
    return Meme(
      id: json['id'] ?? 0,
      catId: json['catId'] ?? '',
      addedBy: json['addedBy'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      status: json['status'] ?? 0,
      reason: json['reason'] ?? '',
      dateTime: json['dateTime'] ?? '',
      totalShare: json['totalShare'] ?? '',
      totalDownloads: json['totalDownloads'] ?? '',
      deactivationReason: json['deactivationReason'] ?? '',
      video: json['video'] ?? '',
      title: json['title'] ?? '',
      category: json['category'] ?? '',
      mediaType: json['media_type'] ?? '',
      downloads: json['downloads'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
    );
  }
}



