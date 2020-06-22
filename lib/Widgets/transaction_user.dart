import 'package:budgetapp/Widgets/transaction_input.dart';
import 'package:budgetapp/Widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import '../Data_models/trasanction_class.dart';
 
class TransactionUser extends StatefulWidget {

  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {


  final List<Transaction> _usertransactions = [
    Transaction(id: "T1", amount: 20, date: DateTime.now(), title: "Shoes"),
    Transaction(id: "T1", amount: 20, date: DateTime.now(), title: "T Shirt"),
  ];

  void _addtransaction(String trtitle, double tramount , ){

    final newtr = Transaction(id: DateTime.now().toString(), amount: tramount, date: DateTime.now(), title: trtitle);

    setState(() {
      _usertransactions.add(newtr);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
       children: <Widget>[
         TransactionInput(_addtransaction),
         TransactionList(_usertransactions),
       ],
    );
  }
}
