import 'package:first_pj/model/category.dart';

import 'expense.dart';

class ExpenseBucket {
  final Category category;
  final List<Expense> expenses;

  const ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses.where((e) => e.category == category).toList();

  double get totalAmount {
    //  expenses.fold(0, (prev, element) => prev + element.amount);
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
