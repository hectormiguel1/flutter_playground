import 'package:app/data/category.dart';
import 'package:app/data/mainCategoryConstants.dart';
import 'package:app/views/subcategory.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<SubCategory> searchResults = [];
  Widget customTitle = Text("Search");
  Icon searchIcon = Icon(Icons.search);

  void search(String text) {
    categories.forEach((element) {
      element.subCats.forEach((element) {
        if (element.name.toLowerCase().contains(text.toLowerCase())) {
          searchResults.add(element);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customTitle,
        actions: [
          IconButton(
            icon: searchIcon,
            onPressed: () {
              setState(() {
                if (this.searchIcon.icon == Icons.search) {
                  this.searchIcon = Icon(Icons.cancel);
                  this.customTitle = TextField(
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    textInputAction: TextInputAction.go,
                    decoration: InputDecoration(
                      hintText: "Enter search here...",
                      border: InputBorder.none,
                    ),
                    onChanged: (text) {
                      setState(() {
                        search(text);
                      });
                    },
                  );
                } else {
                  searchIcon = Icon(Icons.search);
                  setState(() {
                    searchResults = [];
                  });
                  customTitle = Text("Search");
                }
              });
            },
          )
        ],
      ),
      body: MenuItems(searchResults),
    );
  }
}
