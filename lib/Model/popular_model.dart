class PopularDietsModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  bool boxIsSelected;
  PopularDietsModel({
    required this.name,
    required this.iconPath,
    required this.calorie,
    required this.level,
    required this.duration,
    required this.boxIsSelected,
  });
  static List<PopularDietsModel> getPopularDiets() {
    List<PopularDietsModel> popularDiets = [];

    popularDiets.add(PopularDietsModel(
        name: "Blueberry Pancake",
        iconPath: 'assets/images/cake.png',
        calorie: '230kCal',
        level: "Medium",
        duration: '30mins',
        boxIsSelected: true));

        popularDiets.add(PopularDietsModel(
        name: "Blueberry Pancake",
        iconPath: 'assets/images/cake.png',
        calorie: '230kCal',
        level: "Medium",
        duration: '30mins',
        boxIsSelected: true));
        
        popularDiets.add(PopularDietsModel(
        name: "Blueberry Pancake",
        iconPath: 'assets/images/cake.png',
        calorie: '230kCal',
        level: "Medium",
        duration: '30mins',
        boxIsSelected: true));
    return popularDiets;
  }
}
