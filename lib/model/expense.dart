import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import "package:intl/intl.dart";

// final formatter = DateFormat('dd/MM/yyyy');
final formatter = DateFormat.yMd();
const uuid = Uuid();

enum Category { food, travel, leisure, work, other }

const categoryIcons = {
  Category.food: Icons.fastfood,
  Category.travel: Icons.flight,
  Category.leisure: Icons.local_activity,
  Category.work: Icons.work,
  Category.other: Icons.question_mark,
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  get formattedDate {
    // return "${date.day}/${date.month}/${date.year}";
    return formatter.format(date);
  }

  get formattedAmount {
    return "\$${amount.toStringAsFixed(2)}";
  }

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4(); // Generate a unique ID using uuid package
}

class ExpenseBucket {
  ExpenseBucket({
    // required this.id,
    // required this.title,
    required this.category,
    required this.expenses,
  });

  //alternative constructor function
  // ExpenseBucket.category(this.category) : expenses = [];
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
    : expenses = allExpenses {
    for (var expense in allExpenses) {
      if (expense.category == category) {
        expenses.add(expense);
      }
    }
  }

  // final String id;
  // final String title;
  final Category category;
  final List<Expense> expenses;
  double get totalExpenses {
    double total = 0;
    for (var expense in expenses) {
      total += expense.amount;
    }
    return total;
  }
}
