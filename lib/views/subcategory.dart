import 'package:app/data/category.dart';
import 'package:flutter/material.dart';
import '../sizeConfig.dart';

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
                height: SizeConfig.blockSizeVertical * 90,
                width: SizeConfig.blockSizeHorizontal * 90,
                child: MenuItems(category))));
  }
}

class MenuItems extends StatelessWidget {
  Orientation orientation;
  double iconSize = 30;
  Category category;

  MenuItems(this.category);

  Widget _buildSubCatButton(SubCategory subCat) {
    return Padding(
        padding: const EdgeInsets.all(10),
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
            children: category.subCats.map((element) {
              return _buildSubCatButton(element);
            }).toList()));
  }

  @override
  Widget build(BuildContext context) {
    orientation = MediaQuery.of(context).orientation;
    return Center(child: _buildGrid());
  }
}
