import 'package:flutter/material.dart';

class Category {
  String name;
  IconData icon;
  Color bgColor;
  Color iconColor;
  List<SubCategory> subCats = new List<SubCategory>();

  Category(this.name, this.icon, this.bgColor, this.iconColor,
      List<String> subCats) {
    _buildSubCategories(subCats);
  }

  /// Builds the sub category list, and sorts the list in alphabetical order.
  void _buildSubCategories(List<String> subCategories) {
    subCategories.forEach((element) {
      subCats.add(SubCategory(element, this));
    });
    subCats.sort();
    print(subCats);
  }
}

class SubCategory implements Comparable {
  String name;
  Category parent;

  SubCategory(this.name, this.parent);

  @override
  int compareTo(other) {
    return name.compareTo(other.name);
  }
}
