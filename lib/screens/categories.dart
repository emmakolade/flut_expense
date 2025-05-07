import 'package:expense_tracker/data/dummy_data.dart';
import 'package:expense_tracker/widgets/categories_grid.dart';
import 'package:flutter/material.dart';


class CategoriesScreen  extends StatelessWidget {
  const CategoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Pick Category'),
      ),
      body: GridView(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        
      ),
      children:  [
        for (final category in availableCategories)
          CategoriesGridItem(category: category)

      ],

    )
    );
    
  }
}