
class ModuleVideoModel {
  int id;
  String title;
  String description;
  String videoType;
  String videoUrl;

  ModuleVideoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.videoType,
    required this.videoUrl,
  });

  ModuleVideoModel copyWith({
    int? id,
    String? title,
    String? description,
    String? videoType,
    String? videoUrl,
  }) =>
      ModuleVideoModel(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        videoType: videoType ?? this.videoType,
        videoUrl: videoUrl ?? this.videoUrl,
      );

  factory ModuleVideoModel.fromJson(Map<String, dynamic> json) => ModuleVideoModel(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    videoType: json["video_type"],
    videoUrl: json["video_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "video_type": videoType,
    "video_url": videoUrl,
  };
}
