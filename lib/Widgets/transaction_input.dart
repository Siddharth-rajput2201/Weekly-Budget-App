import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class TransactionInput extends StatefulWidget {

  final Function addtr;

  TransactionInput(this.addtr);

  @override
  _TransactionInputState createState() => _TransactionInputState();
}

class _TransactionInputState extends State<TransactionInput> {
  final titlecontroller = TextEditingController();

  final amountcontroller = TextEditingController();

  void submit(){
    final enteredtitle = titlecontroller.text;
    final enteredamount = double.parse(amountcontroller.text);

    if(enteredtitle.isEmpty || enteredamount <= 0)
      {
        return;
      }

    print(widget.addtr(enteredtitle, enteredamount));

    Navigator.of(context).pop();
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
