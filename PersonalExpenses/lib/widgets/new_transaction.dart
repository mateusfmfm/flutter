import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _detailsController = TextEditingController();

  DateTime _selectedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    var enteredDetails = _detailsController.text;

    if (enteredDetails.isEmpty) {
      enteredDetails = "-";
    }

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(enteredTitle, enteredAmount, enteredDetails, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: EdgeInsets.only(bottom: bottom),
          child: Container(
            child: Card(
                child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                      decoration: InputDecoration(labelText: "Title"),
                      controller: _titleController,
                      onSubmitted: (_) => _submitData()),
                  TextField(
                      decoration: InputDecoration(labelText: "Amount"),
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      onSubmitted: (_) => _submitData()),
                  TextField(
                      decoration: InputDecoration(labelText: "Details"),
                      controller: _detailsController,
                      onSubmitted: (_) => _submitData()),
                  Container(
                    height: 70,
                    child: Row(
                      children: <Widget>[
                        Text(_selectedDate == null
                            ? "No Date Chosen!"
                            : DateFormat.yMMMd().format(_selectedDate)),
                        FlatButton(
                          textColor: Theme.of(context).primaryColor,
                          child: Text(
                            "Choose Date",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onPressed: _presentDatePicker,
                        )
                      ],
                    ),
                  ),
                  RaisedButton(
                      child: Text("Add Transation"),
                      color: Theme.of(context).primaryColor,
                      textColor: Theme.of(context).textTheme.button.color,
                      onPressed: _submitData)
                ],
              ),
            )),
          ),
        ),
      ),
    );
  }
}
