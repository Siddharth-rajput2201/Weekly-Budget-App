import 'package:budgetapp/trasanction_class.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Budget App",
      home: MyHomepage(),
    );
  }
}

class MyHomepage extends StatelessWidget {
  final List<Transaction> transaction = [
    Transaction(id: "T1",amount: 20,date: DateTime.now(), title: "Shoes")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Budget App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Text("STATS!"),
            ),
          ),
          Card(
            child: Text("LIST OF TILES"),
          ),
        ],
      )
      );
  }
}
