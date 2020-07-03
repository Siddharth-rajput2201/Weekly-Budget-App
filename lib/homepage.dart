import 'package:budgetapp/Widgets/chart.dart';
import 'package:budgetapp/Widgets/transaction_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:budgetapp/Data_models/trasanction_class.dart';
import 'package:budgetapp/Widgets/transaction_list.dart';

class MyHomepage extends StatefulWidget {

  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {

  final List<Transaction> _usertransactions = [];

  List<Transaction> get _recentTransactions{
      return _usertransactions.where((tx) {
        return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
      }).toList();
  }

  void _addtransaction(String trtitle, double tramount ){

    final newtr = Transaction(id: DateTime.now().toString(), amount: tramount, date: DateTime.now(), title: trtitle);

    setState(() {
      _usertransactions.add(newtr);
    });
  }


  void _startprocesstrasanction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_){
      return GestureDetector(
          onTap: (){},
          behavior: HitTestBehavior.opaque,
          child: TransactionInput(_addtransaction)
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Budget App"),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.add_circle,color: Colors.white,), onPressed: ()=>_startprocesstrasanction(context))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Chart(_recentTransactions),
              TransactionList(_usertransactions),
            ],
          ),
        ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),onPressed: ()=>_startprocesstrasanction(context),),
    );
  }
}
