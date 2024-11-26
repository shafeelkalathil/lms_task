
class ModuleModel {
  int id;
  String title;
  String description;

  ModuleModel({
    required this.id,
    required this.title,
    required this.description,
  });

  ModuleModel copyWith({
    int? id,
    String? title,
    String? description,
  }) =>
      ModuleModel(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
      );

  factory ModuleModel.fromJson(Map<String, dynamic> json) => ModuleModel(
    id: json["id"],
    title: json["title"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
  };
}
