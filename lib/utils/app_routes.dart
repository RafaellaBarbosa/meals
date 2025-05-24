import 'package:flutter/material.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/settings_screen.dart';
import 'package:meals/screens/tabs_screen.dart';

class AppRoutes {
  static const home = '/';
  static const categoriesMeals = '/categories-meals';
  static const mealDetail = '/metal-detail';
  static const settings = '/settings';

  static Map<String, WidgetBuilder> routes = {
    AppRoutes.home: (ctx) => const TabsScreen(),
    AppRoutes.categoriesMeals: (_) => CategoriesMealsScreen(),
    AppRoutes.mealDetail: (_) => MealDetailScreen(),
    AppRoutes.settings: (_) => const SettingsScreen(),
  };
}
