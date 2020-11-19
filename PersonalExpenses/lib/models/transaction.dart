import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final String title;
  final String details;
  final double amount;
  final DateTime date;

  Transaction({
    @required this.id, 
    @required this.title, 
    @required this.details,
    @required this.amount, 
    @required this.date
    });
}
