import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class TransactionInput extends StatelessWidget {

  final titlecontroller = TextEditingController();
  final amountcontroller = TextEditingController();
  final Function addtr;

  TransactionInput(this.addtr);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: titlecontroller,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: amountcontroller,
              decoration: InputDecoration(labelText: 'Amount'),
            ),
            FlatButton(
              child: Text(
                "Add Item",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                print(addtr(titlecontroller.text , double.parse(amountcontroller.text)));
              },
            )
          ],
        ),
      ),
    );
  }
}
