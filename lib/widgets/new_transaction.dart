import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx, {super.key}) {
    print('Constructor NewTransaction Widget');
  }

  @override
  State<NewTransaction> createState() {
    print('createState NewTransaction Widget');
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectDate;

  _NewTransactionState() {
    print('Constructor _NewTransactionState');
  }

  @override
  void initState() {
    print('initState NewTransaction Widget');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies NewTransaction Widget');
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    print('dispose NewTransaction Widget');
    super.dispose();
  }

  void _submitData() {
    if (_titleController.text.isEmpty ||
        _amountController.text.isEmpty ||
        _selectDate == null) {
      return;
    }
    widget.addTx(_titleController.text, double.parse(_amountController.text),
        _selectDate);
    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // CupertinoTextField(
              //   placeholder: 'Title',
              //   controller: _titleController,
              //   onSubmitted: (_) => _submitData(),
              // ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Amount',
                ),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectDate == null
                            ? 'No date choosen!'
                            : 'Purchase Date: ${DateFormat.yMMMd().format(_selectDate!)}',
                      ),
                    ),
                    Platform.isIOS
                        ? CupertinoButton(
                            onPressed: _showDatePicker,
                            child: Text(
                              _selectDate == null
                                  ? 'Choose Date'
                                  : 'Change Date',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          )
                        : TextButton(
                            onPressed: _showDatePicker,
                            child: Text(
                              _selectDate == null
                                  ? 'Choose Date'
                                  : 'Change Date',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                  ],
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: _submitData,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  child: const Text(
                    'Add transaction',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
