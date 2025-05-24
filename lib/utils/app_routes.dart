import 'package:flutter/material.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';

class AppRoutes {
  static const home = '/';
  static const categoriesMeals = '/categories-meals';
  static const mealDetail = '/metal-detail';

  static Map<String, WidgetBuilder> routes = {
    AppRoutes.home: (_) => CategoriesScreen(),
    AppRoutes.categoriesMeals: (_) => CategoriesMealsScreen(),
    AppRoutes.mealDetail: (_) => MealDetailScreen(),
  };
}
