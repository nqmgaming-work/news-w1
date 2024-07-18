import 'package:first_pj/model/category.dart';
import 'package:first_pj/screen/add_expensive/widget/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/expense.dart';
import '../../model/util.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key, required this.onAddExpense});

  final Function(Expense) onAddExpense;

  @override
  State<AddExpense> createState() {
    return _AddExpenseState();
  }
}

class _AddExpenseState extends State<AddExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _dateController = TextEditingController();

  DateTime? _selectedDate;
  Category? _selectedCategory = Category.values.first;

  void _updateSelectedDate(DateTime newDate) {
    setState(() {
      _selectedDate = newDate;
    });
  }

  void _updateSelectedCategory(Category newCategory) {
    setState(() {
      _selectedCategory = newCategory;
    });
  }

  void _onAddExpense() {
    final double amount = double.tryParse(_amountController.text) ?? double.nan;
    if (_titleController.text.trim().isEmpty ||
        _amountController.text.trim().isEmpty ||
        _dateController.text.trim().isEmpty ||
        _selectedCategory == null) {
      // Show an error dialog
      _showDialogIfEmpty('Please fill all the fields');
      return;
    }
    if (amount.isNaN && amount.isNegative) {
      // Show an error dialog
      _showDialogIfEmpty('Please enter a valid amount');
      return;
    }
    Expense expense = Expense(
      title: _titleController.text,
      amount: amount,
      date: _selectedDate ?? DateTime.now(),
      category: _selectedCategory ?? Category.other,
    );
    widget.onAddExpense(expense);
    _titleController.clear();
    _amountController.clear();
    _dateController.clear();
    _updateSelectedDate(DateTime.now());
    _updateSelectedCategory(Category.values.first);
    Navigator.of(context).pop();
  }

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
                _updateSelectedDate(pickedDate);
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
      _updateSelectedDate(pickedDate);
    }
  }

  void _showDialogIfEmpty(String? message) {
    // ios android
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      // dialog ios
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text('Error'),
            content: Text(message ?? 'Please fill all the fields'),
            actions: [
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              )
            ],
          );
        },
      );
    } else {
      // dialog android
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text(message ?? 'Please fill all the fields'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              )
            ],
          );
        },
      );
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 100),
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
          const SizedBox(height: 10),
          // Dropdown
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            // Adjust the padding as needed
            child: DropdownButtonFormField<String>(
              value: _selectedCategory?.toString(),
              decoration: InputDecoration(
                labelText: 'Category',
                labelStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Roboto',
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
              ),
              items: Category.values.map((Category category) {
                return DropdownMenuItem<String>(
                  value: category.toString(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Icon(categoryIcons[category]),
                        // Use the icon from the categoryIcons map
                        const SizedBox(width: 8.0),
                        // Space between the icon and the text
                        Text(category.toString().split('.').last),
                      ],
                    ),
                  ),
                );
              }).toList(),
              onChanged: (String? value) {
                // Handle the selected value
                if (value != null) {
                  _updateSelectedCategory(Category.values.firstWhere(
                      (Category category) => category.toString() == value));
                }
              },
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      _onAddExpense();
                    },
                    child: const Text('Add Expense')),
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
