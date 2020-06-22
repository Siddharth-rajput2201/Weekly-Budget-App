import 'package:budgetapp/Widgets/transaction_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyHomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Budget App"),
        ),
        body: Column(
          //  mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                child: Text("STATS!"),
              ),
            ),
            TransactionUser(),
          ],
        ));
  }
}
