import 'package:flutter/material.dart';
import 'package:app/data/category.dart';
import 'package:flutter/rendering.dart';
import '../sizeConfig.dart';
import '../data/mainCategoryConstants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        drawer: Drawer(
            //build drawer
            ),
        appBar: AppBar(
          title: Text("Categories"),
        ),
        body: Center(
            child: Container(
                height: SizeConfig.blockSizeVertical * 90,
                width: SizeConfig.blockSizeHorizontal * 90,
                child: MainCategoryView())),
        bottomNavigationBar: BottomNavBar());
  }
}

class BottomNavBar extends StatefulWidget {
  BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;

  void _onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color(Theme.of(context).primaryColor.value),
      selectedItemColor: Color(Theme.of(context).accentColor.value),
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
        BottomNavigationBarItem(
            icon: Icon(Icons.message), title: Text("Messages"))
      ],
      currentIndex: selectedIndex,
      onTap: _onTapped,
    );
  }
}

class MainCategoryView extends StatelessWidget {
  double fontSizeScale;
  Orientation orientation;
  double iconSize = 40;

  Widget _buildCatButton(Category cat) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox.expand(
            child: RaisedButton(
          onPressed: () => {/* Handle Press */},
          color: cat.bgColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(cat.icon, color: cat.iconColor, size: iconSize),
              SizedBox(height: 10),
              Text(
                cat.name,
                textAlign: TextAlign.center,
              )
            ],
          ),
        )));
  }

  Widget _buildGrid() {
    return Center(
        child: GridView.count(
            crossAxisCount: orientation == Orientation.portrait ? 2 : 5,
            padding: const EdgeInsets.all(20),
            children: categories.map((element) {
              return _buildCatButton(element);
            }).toList()));
  }

  @override
  Widget build(BuildContext context) {
    fontSizeScale = MediaQuery.of(context).textScaleFactor;
    orientation = MediaQuery.of(context).orientation;
    return Center(child: _buildGrid());
  }
}
