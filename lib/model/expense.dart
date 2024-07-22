import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import 'category.dart';

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = const Uuid().v4();

  String get colorByCategory {
    switch (category) {
      case Category.food:
        return '0xFFff0000';
      case Category.work:
        return '0xFF00ff00';
      case Category.travel:
        return '0xFFff00ff';
      case Category.leisure:
        return '0xFF0000ff';
      case Category.other:
        return '0xFF000000';
      default:
        return '0xFF000000';
    }
  }

  String getFormattedDate() {
    var formatter = DateFormat.yMMMd();
    return formatter.format(date);
  }
}
