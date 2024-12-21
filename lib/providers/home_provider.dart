import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  int currentScreenIndex = 1;

  final TextEditingController searchController = TextEditingController();

  List categoryList = ["Rent", "Buy", "Sell"];
  String categoryValue = "Rent";

  String selectedCategory = "Rent";

  changeScreenIndex(int value) {
    currentScreenIndex = value;
    notifyListeners();
  }

  changeSelectedCategory(value) {
    selectedCategory = value;
    notifyListeners();
  }

  changeCategoryValue(String value) {
    categoryValue = value;
    notifyListeners();
  }
}
