import 'package:flutter/material.dart';
import 'package:meals/components/category_item.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  final List<Category> categories = dummyCategories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vamos Cozinhar!')),
      body: GridView(
        padding: EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children:
            categories.map((category) {
              return CategoryItem(category: category);
            }).toList(),
      ),
    );
  }
}
