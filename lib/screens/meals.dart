import 'package:expense_tracker/model/meals.dart';
import 'package:flutter/material.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'No meals found!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          SizedBox(height: 16),
          Icon(Icons.warning, size: 64),
          Text(
            'Please select a category!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemBuilder: (context, index) => Text(meals[index].title),
      );
    }
    return Scaffold(
      appBar: AppBar(title:  Text(title)),
      body: content,
      // body: ListView.builder(
      //   itemCount: meals.length,
      //   itemBuilder: (context, index) {
      //     return ListTile(
      //       title: Text(meals[index].title),
      //       subtitle: Text(meals[index].title),
      //       leading: CircleAvatar(
      //         backgroundImage: NetworkImage(meals[index].imageUrl),
      //       ),
      //       onTap: () {
      //         // Handle meal selection
      //       },
      //     );
      //   },
      // ),
    );
  }
}
