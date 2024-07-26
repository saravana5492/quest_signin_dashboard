import 'package:uuid/uuid.dart';

class CareerPath {
  final String id = const Uuid().v1();
  final String title;
  final String description;
  final String currentLevelTitle;
  final String currentLevelShortDescription;
  final String currentLevelDescription;
  final int completedPercentage;
  final List<Level> allLevels;

  CareerPath({
    required this.title,
    required this.description,
    required this.currentLevelTitle,
    required this.currentLevelShortDescription,
    required this.currentLevelDescription,
    required this.completedPercentage,
    required this.allLevels,
  });
}

class Level {
  final String id = const Uuid().v1();
  final String title;
  final String description;
  final int totalPoints;
  final int earnedPoints;
  final String userLevelIcon;
  final String image;
  final bool isCompleted;
  final bool showLevelDetails;

  Level({
    required this.title,
    required this.description,
    required this.totalPoints,
    required this.earnedPoints,
    required this.userLevelIcon,
    required this.image,
    required this.isCompleted,
    required this.showLevelDetails,
  });
}
