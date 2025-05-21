import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  static final routeName = '/categories-meals';

  const CategoriesMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    return Scaffold(
      backgroundColor: category.color.withAlpha((0.7 * 255).round()),
      appBar: AppBar(title: Text(category.title)),
      body: Center(
        child: Column(
          children: [
            Text(category.title),
            Text(category.id),
            Text(category.title),
          ],
        ),
      ),
    );
  }
}
