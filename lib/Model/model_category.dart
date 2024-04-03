import 'package:ecommerce_app/components/colors.dart';
import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];
    categories.add(CategoryModel(
        name: "Cake", iconPath: "assets/images/cake.png", boxColor: kBlue));
    categories.add(CategoryModel(
        name: "Pie", iconPath: "assets/images/pie.png", boxColor: kRed));
    categories.add(CategoryModel(
        name: "Salad", iconPath: "assets/images/salad.png", boxColor: kYellow));
    categories.add(CategoryModel(
        name: "Smoothies",
        iconPath: "assets/images/smoothies.png",
        boxColor: kPurple));
    return categories;
  }
}
