import 'package:flutter/material.dart';

class DiteModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  Color boxColor;
  bool viewIsSelected;

  DiteModel(
      {required this.name,
      required this.iconPath,
      required this.level,
      required this.duration,
      required this.calorie,
      required this.boxColor,
      required this.viewIsSelected});

  static List<DiteModel> getDites() {
    List<DiteModel> dites = [];
    dites.add(DiteModel(
      name: "Honey Pancake",
      iconPath: "assets/images/pancakes.svg",
      level: "Easy",
      duration: "30mins",
      boxColor: Colors.pink,
      calorie: "180kCal",
      viewIsSelected: true,
    ));
    dites.add(DiteModel(
      name: "Fruit Salad",
      iconPath: "assets/images/orange-snacks.svg",
      level: "Easy",
      duration: "20mins",
      boxColor: Colors.green,
      calorie: "180kCal",
      viewIsSelected: false,
    ));
    dites.add(DiteModel(
      name: "Shawarma",
      iconPath: "assets/images/plate.svg",
      level: "Medium",
      duration: "50mins",
      boxColor: Colors.blue,
      calorie: "180kCal",
      viewIsSelected: false,
    ));
    dites.add(DiteModel(
      name: "Pie Cake",
      iconPath: "assets/images/pie.svg",
      level: "Medium",
      duration: "80mins",
      boxColor: Colors.purple,
      calorie: "180kCal",
      viewIsSelected: false,
    ));
    return dites;
  }
}
