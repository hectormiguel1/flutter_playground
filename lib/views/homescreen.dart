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
        body: MainCategoryView(),
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
  List<Category> categories = [
    Category("Medical", Icons.local_hospital, Colors.red.shade100,
        Colors.red.shade700, <SubCat>[]),
    Category("Surgery", Icons.local_hospital, Colors.blue.shade100,
        Colors.blue.shade700, <SubCat>[]),
    Category("Trauma", Icons.local_hospital, Colors.yellow.shade100,
        Colors.yellow.shade700, <SubCat>[]),
    Category("Toxicology", Icons.local_hospital, Colors.green.shade100,
        Colors.green.shade700, <SubCat>[]),
    Category("Foreign Ingestion", Icons.local_hospital, Colors.purple.shade100,
        Colors.purple.shade700, <SubCat>[]),
  ];

  Widget _buildCatButton(Category cat) {
    return SizedBox.expand(
        child: RaisedButton(
      onPressed: () => {/* Handle Press */},
      color: cat.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(cat.icon, color: cat.iconColor), Text(cat.name)],
      ),
    ));
  }

  Widget _buildGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
      itemCount: 5,
      itemBuilder: (context, index) => _buildCatButton(categories[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: _buildGrid());
  }
}
