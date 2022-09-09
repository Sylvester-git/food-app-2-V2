import 'package:flutter/material.dart';
import '../Dummy_data.dart';
import '../Screens/filter.dart';
import '../models/meal.dart';

import '../Screens/errorscreen/error_screen.dart';
import '../Screens/tab_screens.dart';

import './Screens/meal_detail.dart';

import 'Screens/categorised_meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<meal> _availablemeal = meal_data;
  Map<String, bool> _filters = {
    'Gluten': false,
    'Lactose': false,
    'Vegan': false,
    'Vegetarian': false,
  };

  void _savefilterdata(Map<String, bool> filterdata) {
    setState(() {
      _filters = filterdata;
      _availablemeal = meal_data.where((meals) {
        if (_filters['Gluten']! && !meals.isGlutenfree) {
          return false;
        }
        if (_filters['Vegan']! && !meals.isVegan) {
          return false;
        }
        if (_filters['Lactose']! && !meals.islactosefree) {
          return false;
        }
        if (_filters['Vegetarian']! && !meals.isvegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal,
        fontFamily: 'Raleway',
        canvasColor: Colors.white,
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(
                  20,
                  51,
                  51,
                  1,
                ),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(
                  20,
                  51,
                  51,
                  1,
                ),
              ),
              headline5: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold),
            ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.teal,
        ).copyWith(secondary: Colors.cyanAccent),
      ),
      //home: Homepage(),

      //using navigator.pushnamed
      initialRoute: './',
      routes: {
        './': (context) => Tabscreen(),
        CategoryDetailscreen.routname: (context) =>
            CategoryDetailscreen(_availablemeal),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_filters, _savefilterdata)
      },

      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) {
          return ErrorScreen();
        });
      },
    );
  }
}
