import 'package:flutter/material.dart';
import 'package:food_choice_app/Widgets/drawer.dart';
import '../Screens/Categories.dart';
import '../Screens/favorites.dart';

class Tabscreen extends StatefulWidget {
  const Tabscreen({super.key});

  @override
  State<Tabscreen> createState() => _TabscreenState();
}

class _TabscreenState extends State<Tabscreen> {
  //Page list
  final List<Map<String, dynamic>> _pages = [
    {'page': CategoryScreen(), 'title': 'Category'},
    {'page': Favoritescreen(), 'title': 'Favorite'},
  ];
  int _selectedindex = 0;
  void _selectedpage(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedindex]['title']),
      ),
      drawer: Drawerwidget(),
      body: _pages[_selectedindex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          elevation: 4,
          backgroundColor: Colors.white,
          onTap: _selectedpage,
          currentIndex: _selectedindex,
          //type: BottomNavigationBarType.shifting,

          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.category_rounded,
              ),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_rounded,
              ),
              label: 'Favorites',
            ),
          ]),
    );
  }
}
//Note, when making a bottom or top appbar, create it in a separate file
/*
 DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('DeliFoods'),
          bottom: TabBar(
              indicatorColor: Colors.teal.shade300,
              indicatorWeight: 4,
              tabs: const <Widget>[
                //First Tab
                Tab(
                  icon: Icon(
                    Icons.category_rounded,
                  ),
                  text: 'Categories',
                ),
                //secondTab
                Tab(
                  icon: Icon(Icons.favorite_rounded),
                  text: 'Favorite',
                ),
              ]),
        ),
        //Note that the defaulttabcontroller controls which tab was pressed and then tabbarview shows
        //the screen in a sequencial oreder i.e the category will show the first widget in the tabbarview
        body: const TabBarView(children: [
          CategoryScreen(),
          Favoritescreen(),
        ]),
      ),
    );
*/