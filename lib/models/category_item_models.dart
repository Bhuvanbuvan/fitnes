import 'package:flutter/material.dart';

class CategoryItemModels {
  Color itemColor;
  String itemText;
  String itemIcon;

  CategoryItemModels({
    required this.itemText,
    required this.itemIcon,
    required this.itemColor,
  });

  static List<CategoryItemModels> getCategoryItems() {
    List<CategoryItemModels> category = [];
    category.add(
      CategoryItemModels(
        itemText: "Pancake",
        itemIcon: "assets/images/pancakes.svg",
        itemColor: Colors.pink,
      ),
    );
    category.add(
      CategoryItemModels(
        itemText: "Pie",
        itemIcon: "assets/images/pie.svg",
        itemColor: Colors.green,
      ),
    );
    category.add(
      CategoryItemModels(
        itemText: "Orange",
        itemIcon: "assets/images/orange-snacks.svg",
        itemColor: Colors.pink,
      ),
    );
    category.add(
      CategoryItemModels(
        itemText: "Plate",
        itemIcon: "assets/images/plate.svg",
        itemColor: Colors.blue,
      ),
    );
    return category;
  }
}
