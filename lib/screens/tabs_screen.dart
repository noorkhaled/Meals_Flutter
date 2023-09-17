import 'package:flutter/material.dart';
import 'package:mealapp/screens/categories_screen.dart';
import 'package:mealapp/screens/favourite_screen.dart';
import 'package:mealapp/widgets/maindrawer.dart';
import 'package:mealapp/modules/meal.dart';
class tabsscreen extends StatefulWidget {
  final List<Meal> favouritemeals;

  const tabsscreen(this.favouritemeals);

  @override
  State<tabsscreen> createState() => _tabsscreenState();
}


class _tabsscreenState extends State<tabsscreen> {

  late List<Map<String,Object>> pages;
  @override
  void initState() {
   pages = [
      {
        'page':categoryscreen(),
        'title':'Categories'
      },
      {
        'page':favouritescreen(widget.favouritemeals),
        'title':'Your Favourites'
      },
    ];
    super.initState();
  }


  int selectedpageindex = 0 ;
  void selectpage(int value) {
    setState(() {
      selectedpageindex = value ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${pages[selectedpageindex]['title']}'),
      ),
      body: pages[selectedpageindex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectpage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: selectedpageindex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
            label: 'Categories',

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
      ),
      drawer: maindrawer(),
    );
  }

}
