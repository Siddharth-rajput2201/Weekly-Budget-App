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

  final List<Transaction> _usertransactions = [
    Transaction(id: "T1", amount: 20, date: DateTime.now(), title: "Shoes"),
    Transaction(id: "T1", amount: 20, date: DateTime.now(), title: "T Shirt"),
  ];

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
              Container(
                width: double.infinity,
                child: Card(
                  child: Text("STATS!"),
                ),
              ),
              TransactionList(_usertransactions),
            ],
          ),
        ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),onPressed: ()=>_startprocesstrasanction(context),),
    );
  }
}
