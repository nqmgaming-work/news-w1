import 'package:first_pj/screen/add_expensive/widget/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() {
    return _AddExpenseState();
  }
}

class _AddExpenseState extends State<AddExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _dateController = TextEditingController();

  void _showIOSDatePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return SizedBox(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (pickedDate) {
                // Format and set the date to the controller
                String formattedDate = DateFormat('yyyy-MM-dd')
                    .format(pickedDate); // Use your preferred date format
                _dateController.text = formattedDate;
              },
              initialDateTime: DateTime.now(),
              minimumYear: 2000,
              maximumYear: DateTime.now().year,
            ),
          );
        });
  }

  Future<void> _showAndroidDatePicker(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000), // Adjust the range as needed
      lastDate: DateTime(2025),
    );
    if (pickedDate != null) {
      // Format and set the date to the controller
      String formattedDate = DateFormat('yyyy-MM-dd')
          .format(pickedDate); // Use your preferred date format
      _dateController.text = formattedDate;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          CustomTextField(
            controller: _titleController,
            labelText: 'Title',
            prefixIcon: Icons.title,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: _amountController,
                  labelText: 'Amount',
                  prefixIcon: Icons.attach_money,
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 10),
              // Date
              Expanded(
                child: CustomTextField(
                  controller: _dateController,
                  labelText: 'Date',
                  prefixIcon: Icons.calendar_today,
                  onTap: () {
                    if (Theme.of(context).platform == TargetPlatform.iOS) {
                      _showIOSDatePicker(context);
                    } else {
                      _showAndroidDatePicker(context);
                    }
                  },
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                    onPressed: () {}, child: const Text('Add Expense')),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel')),
              ),
            ],
          )
        ],
      ),
    );
  }
}
