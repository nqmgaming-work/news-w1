import 'package:intl/intl.dart';

String formatDateBydMMMYYYY(DateTime date) {
  return DateFormat('d MMM, yyyy').format(date);
}