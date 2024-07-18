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
                if (pickedDate != null) {
                  // Format and set the date to the controller
                  String formattedDate = DateFormat('yyyy-MM-dd')
                      .format(pickedDate); // Use your preferred date format
                  _dateController.text = formattedDate;
                }
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
          TextField(
            controller: _titleController,
            maxLength: 50,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              label: const Text('Title'),
              prefixIcon: const Icon(Icons.title),
              labelStyle: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.normal,
                fontFamily: 'Roboto',
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              helperText: 'Enter the title of the expense',
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 1,
                ),
              ),
            ),
            cursorColor: Colors.black,
            cursorHeight: 20,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: const Text('Amount'),
                    prefixIcon: const Icon(Icons.attach_money),
                    labelStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Roboto',
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    helperText: 'Enter the amount of the expense',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                  ),
                  cursorColor: Colors.black,
                  cursorHeight: 20,
                  textInputAction: TextInputAction.done,
                ),
              ),
              const SizedBox(width: 10),
              // Date
              Expanded(
                child: TextField(
                  controller: _dateController,
                  readOnly: true,
                  onTap: () async {
                    if (Theme.of(context).platform == TargetPlatform.iOS) {
                      _showIOSDatePicker(context);
                    } else {
                      await _showAndroidDatePicker(context);
                    }
                  },
                  maxLength: 30,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: const Text('Date'),
                    prefixIcon: const Icon(Icons.calendar_today),
                    labelStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Roboto',
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    helperText: 'Enter the date of the expense',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                  ),
                  cursorColor: Colors.black,
                  cursorHeight: 20,
                  textInputAction: TextInputAction.done,
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
