import 'package:flutter/material.dart';

import '../../../model/expense.dart';
import 'expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenseList});

  final List<Expense> expenseList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ExpenseItem(expense: expenseList[index]),
      itemCount: expenseList.length,
    );
  }
}
