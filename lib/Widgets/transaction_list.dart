import 'package:flutter/material.dart';
import 'package:budgetapp/Data_models/trasanction_class.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;

  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Column(
        children: transactions.map((tr) {
      return Card(
          child: Row(
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.green, width: 2)),
              child: Text(
                '₹ ' + "${tr.amount}",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                tr.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              Text(
                DateFormat().format(tr.date),
                style: TextStyle(color: Colors.grey[500]),
              ),
            ],
          )
        ],
      ));
    }).toList());
  }
}
