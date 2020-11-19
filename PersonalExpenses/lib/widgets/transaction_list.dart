import 'package:PersonalExpenses/widgets/transaction_details.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TransactionDetails(
                          transactions[index].title,
                          transactions[index].amount,
                          transactions[index].details,
                          transactions[index].date)));
            },
            child: Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: FittedBox(
                          child: Text(
                              '\$${transactions[index].amount.toStringAsFixed(2)}')),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle:
                      Text(DateFormat.yMMMd().format(transactions[index].date)),
                  trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => Scaffold.of(context).showSnackBar(
                            SnackBar(
                              duration: const Duration(seconds: 10),
                              backgroundColor: Colors.grey,
                              content: Container(
                                height: 20,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Container(
                                      child: Text('Really want to delete?',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Container(
                                      child: SizedBox(
                                        width: 10,
                                      ),
                                    ),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: Container(
                                        child: RaisedButton(
                                          child: Text("Yes"),
                                          color: Colors.red,
                                          onPressed: () => {
                                            deleteTx(transactions[index].id),
                                            Scaffold.of(context)
                                                .hideCurrentSnackBar()
                                          },
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: Container(
                                        child: RaisedButton(
                                          child: Text("Cancel"),
                                          color: Colors.green,
                                          onPressed: () {
                                            Scaffold.of(context)
                                                .hideCurrentSnackBar();
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ))),
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
