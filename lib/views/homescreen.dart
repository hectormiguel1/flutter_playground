import 'package:app/views/search.dart';
import 'package:app/views/subcategory.dart';
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
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              },
            ),
          ],
        ),
        body: Center(
            child: Container(
                height: SizeConfig.blockSizeVertical * 99,
                width: SizeConfig.blockSizeHorizontal * 99,
                child: MainCategoryView())),
        bottomNavigationBar: BottomNavBar(Theme.of(context).primaryColor));
  }
}

// ignore: must_be_immutable
class BottomNavBar extends StatefulWidget {
  Color navBarColor;
  BottomNavBar(this.navBarColor);
  BottomNavBarState createState() => BottomNavBarState(navBarColor);
}

class BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;
  Color navBarColor;

  BottomNavBarState(this.navBarColor);
  void _onTapped(int index) {
    setState(() {
      selectedIndex = index;

      if (index == 0) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: navBarColor,
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

// ignore: must_be_immutable
class MainCategoryView extends StatelessWidget {
  Orientation orientation;
  double iconSize = 40;
  BuildContext context;

  Widget _buildCatButton(Category cat) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox.expand(
            child: RaisedButton(
          onPressed: () => {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SubCategoryView(cat)))
          },
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
        child: GridView.extent(
            maxCrossAxisExtent: 300,
            mainAxisSpacing: 20,
            padding: const EdgeInsets.all(20),
            children: categories.map((element) {
              return _buildCatButton(element);
            }).toList()));
  }

  @override
  Widget build(BuildContext context) {
    orientation = MediaQuery.of(context).orientation;
    this.context = context;
    return Center(child: _buildGrid());
  }
}
