import 'package:expense_tracker/model/category.dart';
import 'package:flutter/material.dart';

class CategoriesGridItem extends StatelessWidget {
  const CategoriesGridItem({
    super.key,
    required this.category,
    // required this.onSelectCategory,
  });

  final Category category;
  // final void Function() onSelectCategory;
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: onSelectCategory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withValues(alpha: 0.7),
              category.color.withValues(alpha: 0.7),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
