import 'package:first_pj/screen/home/widget/expense_chart.dart';
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

  void onAddExpense(Expense expense) {
    setState(() {
      _expenses.add(expense);
    });
  }

  void _onRemoveExpense(Expense expense) {
    final expressIndex = _expenses.indexOf(expense);
    setState(() {
      _expenses.remove(expense);
    });
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          'Expense removed',
          style: TextStyle(
            color: Colors.red,
          ),
        ),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            setState(() {
              _expenses.insert(expressIndex, expense);
            });
          },
        ),
      ),
    );
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => AddExpense(
        onAddExpense: onAddExpense,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expenses added yet'),
    );

    if (_expenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenseList: _expenses,
        onRemoveExpense: _onRemoveExpense,
      );
    }

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
            ExpenseChart(expenseList: _expenses),
            Expanded(
              child: mainContent,
            ),
          ],
        ),
      ),
    );
  }
}
