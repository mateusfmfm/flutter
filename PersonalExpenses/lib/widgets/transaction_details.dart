import 'package:PersonalExpenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionDetails extends StatelessWidget {
  final List<Transaction> transactions = [];

  final String title;
  final double amount;
  final String details;
  final DateTime date;

  TransactionDetails(this.title, this.amount, this.details, this.date);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                  margin: EdgeInsets.all(10),
                  child: CircleAvatar(
                    radius: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: FittedBox(
                          child: Text(
                        '\$${amount.toStringAsFixed(2)}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                    ),
                  )),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      "Purchase Date:",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      DateFormat.yMMMd().format(date),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.grey[500]),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      "Details:" ,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      details.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.grey[500]),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
