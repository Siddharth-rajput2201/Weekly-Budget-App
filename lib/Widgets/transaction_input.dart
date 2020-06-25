import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class TransactionInput extends StatelessWidget {

  final titlecontroller = TextEditingController();
  final amountcontroller = TextEditingController();
  final Function addtr;

  TransactionInput(this.addtr);

  void submit(){
    final entered_title = titlecontroller.text;
    final entered_amount = double.parse(amountcontroller.text);

    if(entered_title.isEmpty || entered_amount <= 0)
      {
        return;
      }

    print(addtr(entered_title, entered_amount));
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
