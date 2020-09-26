import 'package:flutter/material.dart';

class Category {
  String name;
  IconData icon;
  Color bgColor;
  Color iconColor;
  List<SubCat> subCats;

  Category(this.name, this.icon, this.bgColor, this.iconColor, this.subCats);
}

class SubCat {
  String name;
  Category parent;

  SubCat(this.name, this.parent);
}
