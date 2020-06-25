import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class TransactionInput extends StatelessWidget {

  final titlecontroller = TextEditingController();
  final amountcontroller = TextEditingController();
  final Function addtr;

  TransactionInput(this.addtr);

  void submit(){
    final enteredtitle = titlecontroller.text;
    final enteredamount = double.parse(amountcontroller.text);

    if(enteredtitle.isEmpty || enteredamount <= 0)
      {
        return;
      }

    print(addtr(enteredtitle, enteredamount));
  }

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
              onSubmitted: (_) => submit(),
            ),
            TextField(
              controller: amountcontroller,
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submit(),
            ),
            FlatButton(
              child: Text(
                "Add Item",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: submit,
            )
          ],
        ),
      ),
    );
  }
}
