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

  String getFormattedDate() {
    var formatter = DateFormat.yMMMd();
    return formatter.format(date);
  }
}
