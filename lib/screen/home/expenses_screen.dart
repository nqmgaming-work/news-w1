import 'package:first_pj/screen/home/widget/expenses_list.dart';
import 'package:flutter/material.dart';

import '../../model/category.dart';
import '../../model/expense.dart';
import '../add_expensive/add_expense_screen.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensiveState();
  }
}

class _ExpensiveState extends State<Expenses> {
  final List<Expense> _expenses = [
    Expense(
      title: 'Pizza',
      amount: 69.99,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Shoes',
      amount: 16.53,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'Gas',
      amount: 99.99,
      date: DateTime.now(),
      category: Category.travel,
    ),
    Expense(
      title: 'Salary',
      amount: 450.00,
      date: DateTime.now(),
      category: Category.work,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        context: context, builder: (context) => const AddExpense());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Expenses'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                _openAddExpenseOverlay();
              },
            ),
          ],
        ),
        body: Column(
          children: [
            const Text('The chart'),
            Expanded(
              child: ExpensesList(expenseList: _expenses),
            ),
          ],
        ),
      ),
    );
  }
}
