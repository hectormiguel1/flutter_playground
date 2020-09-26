import 'package:flutter/material.dart';
import 'package:app/data/category.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
            //build drawer
            ),
        appBar: AppBar(
          title: Text("Categories"),
        ),
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

  Widget _buildGrid() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
      itemCount: 5,  
      itemBuilder: 
      );
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child:

    );
  }
}

class CategoryButton {
  CategoryButton(Category cat) {
    return Center(
      child: Column(
        children: <Widget>[
          Icon(cat.),
        ],
      ),
    );
  }
}
