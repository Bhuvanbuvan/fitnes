class PopularDiteModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  bool boxIsSelected;

  PopularDiteModel(
      {required this.name,
      required this.iconPath,
      required this.level,
      required this.duration,
      required this.calorie,
      required this.boxIsSelected});
  static List<PopularDiteModel> getPopularDiets() {
    List<PopularDiteModel> popularDiets = [];

    popularDiets.add(PopularDiteModel(
      name: 'Blueberry Pancake',
      iconPath: "assets/images/pancakes.svg",
      level: 'Medium',
      duration: '30mins',
      calorie: '230kCal',
      boxIsSelected: true,
    ));

    popularDiets.add(PopularDiteModel(
      name: 'Salmon Nigiri',
      iconPath: "assets/images/orange-snacks.svg",
      level: 'Easy',
      duration: '20mins',
      calorie: '120kCal',
      boxIsSelected: false,
    ));

    return popularDiets;
  }
}
