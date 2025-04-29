import 'package:expense_tracker/new_expense.dart';
import 'package:expense_tracker/widgets/expenses_list.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: "Courses ",
      amount: 99.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: "Groceries",
      amount: 50.00,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: "Travel",
      amount: 200.00,
      date: DateTime.now(),
      category: Category.travel,
    ),
    Expense(
      title: "Leisure",
      amount: 150.00,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _addExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: const Text("Expense deleted"),
    //     duration: const Duration(seconds: 2),
    //     action: SnackBarAction(
    //       label: "Undo",
    //       onPressed: () {
    //         setState(() {
    //           _registeredExpenses.insert(expenseIndex, expense);
    //         });
    //       },
    //     ),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        actions: [
          IconButton(
            onPressed: _addExpenseOverlay,
            icon: const Icon(Icons.add_circle_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          Text("The Chart"),
          Expanded(
            child: ExpensesList(
              expenses: _registeredExpenses,
              onRemoveExpense: _removeExpense,
            ),
          ),
        ],
      ),
    );
  }
}
