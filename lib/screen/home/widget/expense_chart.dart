import 'package:flutter/cupertino.dart';

import '../../../model/expense.dart';
import 'package:fl_chart/fl_chart.dart';

class ExpenseChart extends StatefulWidget {
  const ExpenseChart({super.key, required this.expenseList});

  final List<Expense> expenseList;

  @override
  State<ExpenseChart> createState() {
    return _ExpenseChart();
  }
}

class _ExpenseChart extends State<ExpenseChart> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 200,
            child: PieChart(
              PieChartData(
                sections: List.generate(
                  widget.expenseList.length,
                  (index) => PieChartSectionData(
                    value: widget.expenseList[index].amount,
                    color: Color(int.parse(widget.expenseList[index].colorByCategory)),
                    title: widget.expenseList[index].title,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

