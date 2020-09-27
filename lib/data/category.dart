import 'package:flutter/material.dart';

class Category {
  String name;
  IconData icon;
  Color bgColor;
  Color iconColor;
  List<SubCategory> subCats = new List<SubCategory>();

  Category(this.name, this.icon, this.bgColor, this.iconColor,
      List<String> subCats) {
    try {
      _buildSubCategories(subCats);
    } on Exception catch (e) {
      print(e);
    }
  }

  /// Builds the sub category list, and sorts the list in alphabetical order.
  void _buildSubCategories(List<String> subCategories) {
    subCategories.forEach((element) {
      subCats.add(SubCategory(element, this, this.icon));
    });
    subCats.sort();
  }
}

class SubCategory implements Comparable {
  String name;
  Category parent;
  IconData icon;

  SubCategory(this.name, this.parent, this.icon);

  @override
  int compareTo(other) {
    return name.compareTo(other.name);
  }
}
