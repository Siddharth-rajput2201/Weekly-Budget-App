import 'package:flutter/material.dart';
import 'package:budgetapp/trasanction_class.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

class MyHomepage extends StatelessWidget {
  final List<Transaction> transaction = [
    Transaction(id: "T1",amount: 20,date: DateTime.now(), title: "Shoes"),
    Transaction(id: "T1",amount: 20,date: DateTime.now(), title: "T Shirt"),
  ];
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
            Card(child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(decoration: InputDecoration(labelText: 'Title'),),
                  TextField(decoration: InputDecoration(labelText: 'Amount'),),
                  FlatButton(child: Text("Add Item",style: TextStyle(color : Colors.red),),onPressed: (){},)
                ],
              ),
            ),),
            Column(
                children : transaction.map((tr){
                  return Card (child: Row(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.all(10),
                          margin : EdgeInsets.symmetric(vertical: 10 ,horizontal: 10),
                          decoration: BoxDecoration(border : Border.all(color: Colors.green,width: 2 )),
                          child: Text('₹ '+ "${tr.amount}" , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.green),)
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(tr.title , style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                          Text( DateFormat().format(tr.date) , style: TextStyle(color: Colors.grey[500]),),
                        ],
                      )
                    ],
                  ));
                }).toList()
            )
          ],
        )
    );
  }
}
