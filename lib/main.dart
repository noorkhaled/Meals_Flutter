import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';
import 'package:mealapp/screens/categories_screen.dart';
import 'package:mealapp/screens/categorymeal_screen.dart';
import 'package:mealapp/screens/favourite_screen.dart';
import 'package:mealapp/screens/filters_screen.dart';
import 'package:mealapp/screens/mealdetails_screen.dart';
import 'package:mealapp/screens/tabs_screen.dart';
import 'package:mealapp/modules/meal.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

void setfilters(Map<String,bool> filterdata){
  setState(() {
        filters = filterdata;
        availablemeal = DUMMY_MEALS.where((meal){
           if(filters['Gluten']! && !meal.isGlutenFree){
             return false;
           };
           if(filters['Lactose']! && !meal.isLactoseFree){
             return false;
           };
           if(filters['Vegan']! && !meal.isVegan){
             return false;
           };
           if(filters['Vegetarian']! && !meal.isVegetarian){
             return false;
           }
           return true;
        }).toList();
});
}

void togglefav(String mealid){
  final existingindex = favouritemeal.indexWhere((meal) => meal.id == mealid);
  if(existingindex>=0){
    setState(() {
        favouritemeal.removeAt(existingindex);
  });
    }
  else{
    setState(() {
      favouritemeal.add(DUMMY_MEALS.firstWhere((meal) =>  meal.id == mealid));
    });
  }
  }

  bool ismealfav(String mealid){
  return favouritemeal.any((meal) => meal.id == mealid);
  }

  Map<String,bool> filters = {
    'Gluten':false,
    'Lactose':false,
    'Vegan':false,
    'Vegetarian':false,
  };
List<Meal> availablemeal = DUMMY_MEALS;
List<Meal> favouritemeal = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyLarge: TextStyle(
            color: Color.fromRGBO(20, 50, 50, 1),
          ),
          bodyMedium: TextStyle(
              color: Color.fromRGBO(20, 50, 50, 1),
          ),
          titleMedium: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      //home: MyHomePage(),
      //home: categoryscreen(),
      routes: {
        '/': (context) => tabsscreen(favouritemeal),
        categorymealscreen.routename:(context)=>categorymealscreen(availablemeal),
        mealdetailedscreen.routename:(context)=>mealdetailedscreen(togglefav,ismealfav),
        filterscreen.routename:(context)=>filterscreen(setfilters,filters),

      },
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal App"),
      ),
      body: null,
    );
  }
}
