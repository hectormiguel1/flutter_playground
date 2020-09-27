import 'package:app/data/category.dart';
import 'package:flutter/material.dart';
import '../sizeConfig.dart';

// ignore: must_be_immutable
class SubCategoryView extends StatefulWidget {
  Category category;
  SubCategoryView(this.category);
  _SubCategoryViewState createState() => _SubCategoryViewState(category);
}

class _SubCategoryViewState extends State<SubCategoryView> {
  Category category;
  _SubCategoryViewState(this.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(category.name),
          backgroundColor: category.iconColor,
        ),
        body: Center(
            child: Container(
                height: SizeConfig.blockSizeVertical * 95,
                width: SizeConfig.blockSizeHorizontal * 95,
                child: MenuItems(category))));
  }
}

class MenuItems extends StatefulWidget {
  final Category category;

  MenuItems(this.category);

  @override
  _MenuItemsState createState() => _MenuItemsState();
}

class _MenuItemsState extends State<MenuItems> {
  Orientation orientation = Orientation.landscape;

  final double iconSize = 30;

  Widget _buildSubCatButton(SubCategory subCat) {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: SizedBox.expand(
            child: RaisedButton(
                onPressed: () => {/* Handle move to diagnosis window */},
                color: subCat.parent.bgColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(subCat.parent.icon,
                        color: subCat.parent.iconColor, size: iconSize),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      subCat.name,
                      textAlign: TextAlign.center,
                      softWrap: true,
                    )
                  ],
                ))));
  }

  Widget _buildGrid() {
    return Center(
        child: GridView.count(
            crossAxisCount: orientation == Orientation.portrait ? 3 : 6,
            padding: const EdgeInsets.all(10),
            children: widget.category.subCats.map((element) {
              return _buildSubCatButton(element);
            }).toList()));
  }

  @override
  Widget build(BuildContext context) {
    orientation = MediaQuery.of(context).orientation;
    return Center(child: _buildGrid());
  }
}
