
class SubjectModel {
  int id;
  String title;
  String description;
  String image;

  SubjectModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
  });

  SubjectModel copyWith({
    int? id,
    String? title,
    String? description,
    String? image,
  }) =>
      SubjectModel(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        image: image ?? this.image,
      );

  factory SubjectModel.fromJson(Map<String, dynamic> json) => SubjectModel(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "image": image,
  };
}
