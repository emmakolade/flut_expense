import 'package:expense_tracker/widgets/expenses_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) {
        final expenseIndex = expenses[index];
        return Dismissible(
          key: ValueKey(expenseIndex),
          // background: Container(
          //   color: Theme.of(context).colorScheme.error,
          //   child: const Icon(Icons.delete),
          // ),
          onDismissed: (direction) {
            onRemoveExpense(expenseIndex);
          },
          child: ExpensesItem(expense: expenseIndex),
        );
      },
    );
  }
}
