class Exercise {
  final String id;
  final String name;
  final String description;
  final List<String> targetMuscles;
  final List<String> secondaryMuscles;
  final String equipment;
  final String difficulty;
  final List<String> videoUrl;
  final List<String> imageUrl;
  final String workoutName;
  final DateTime createdAt;
  final DateTime updatedAt;

  Exercise({
    required this.id,
    required this.name,
    required this.description,
    required this.targetMuscles,
    required this.secondaryMuscles,
    required this.equipment,
    required this.difficulty,
    required this.videoUrl,
    required this.imageUrl,
    required this.workoutName,
    required this.createdAt,
    required this.updatedAt,
  });

  // Convert JSON to Exercise object
  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      id: json["_id"],
      name: json["name"],
      description: json["description"],
      targetMuscles: List<String>.from(json["targetMuscles"]),
      secondaryMuscles: List<String>.from(json["secondaryMuscles"]),
      equipment: json["equipment"],
      difficulty: json["difficulty"],
      videoUrl: List<String>.from(json["videoUrl"]),
      imageUrl: List<String>.from(json["imageUrl"]),
      workoutName: json["workoutName"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
    );
  }
}
