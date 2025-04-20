import 'dart:convert';

List<WorkoutModel> workoutModelFromJson(Map<String, dynamic> json) =>
    List<WorkoutModel>.from(json["data"].map((x) => WorkoutModel.fromJson(x)));


class WorkoutModel {
  final String id;
  final String name;
  final String description;
  final List<String> imageUrl;
  final List<String> exercises;

  WorkoutModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.exercises,
  });

  factory WorkoutModel.fromJson(Map<String, dynamic> json) => WorkoutModel(
    id: json["_id"] ?? "",
    name: json["name"] ?? "No Name",
    description: json["description"] ?? "No Description",
    imageUrl: json["imageUrl"] != null
        ? List<String>.from(json["imageUrl"].map((x) => x ?? ""))
        : [],
    exercises: json["exercises"] != null
        ? List<String>.from(json["exercises"].map((x) => x ?? ""))
        : [],
  );


  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "description": description,
    "imageUrl": List<dynamic>.from(imageUrl.map((x) => x)),
    "exercises": List<dynamic>.from(exercises.map((x) => x)),
  };
}
