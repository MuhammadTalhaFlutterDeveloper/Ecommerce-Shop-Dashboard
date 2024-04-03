class DietModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  bool viewIsSelected;
  

  DietModel({
    required this.name,
    required this.iconPath,
    required this.calorie,
    required this.level,
    required this.duration,
    required this.viewIsSelected,
  });

  static List<DietModel> getDiet() {
    List<DietModel> diets = [];
    diets.add(DietModel(
        name: 'Honey Pancake',
        iconPath: 'assets/images/honey.png',
        calorie: '180kCal',
        level: 'Easy',
        duration: '30mins',
        viewIsSelected: true));
    diets.add(DietModel(
        name: 'Canai Bred',
        iconPath: 'assets/images/canai.png',
        calorie: '170kCal',
        level: 'Medium',
        duration: '30mins',
        viewIsSelected: true));
    diets.add(DietModel(
        name: 'Smoothies',
        iconPath: 'assets/images/canai.png',
        calorie: '180kCal',
        level: 'Easy',
        duration: '30mins',
        viewIsSelected: true));
    diets.add(DietModel(
        name: 'Bred',
        iconPath: 'assets/images/canai.png',
        calorie: '180kCal',
        level: 'Easy',
        duration: '30mins',
        viewIsSelected: true));
    return diets;
  }
}
