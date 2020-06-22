import 'package:flutter/material.dart';
import 'package:budgetapp/Data_models/trasanction_class.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final List<Transaction> _usertransactions = [
    Transaction(id: "T1", amount: 20, date: DateTime.now(), title: "Shoes"),
    Transaction(id: "T1", amount: 20, date: DateTime.now(), title: "T Shirt"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        children: _usertransactions.map((tr) {
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
