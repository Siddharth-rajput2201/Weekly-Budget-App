import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';

class TransactionInput extends StatefulWidget {

  final Function addtr;

  TransactionInput(this.addtr);

  @override
  _TransactionInputState createState() => _TransactionInputState();
}

class _TransactionInputState extends State<TransactionInput> {
  final titlecontroller = TextEditingController();

  final amountcontroller = TextEditingController();

  DateTime selecteddate;

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

  void datepicker()
  {
    showDatePicker(
        context: context, initialDate: DateTime.now(), firstDate: DateTime(2020), lastDate: DateTime.now()
    ).then((pickeddate){
      if(pickeddate == null)
        {
          return;
        }
      setState(() {
        selecteddate = pickeddate;
      });

    });
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

            SizedBox(height: 10,),
            Row(
              children: <Widget>[
                Text(selecteddate == null ? "No Date Chosen" : 'Picked Date : ${DateFormat.yMd().format(selecteddate)}'),
                FlatButton(onPressed: datepicker, child: Text("Chose Date"),textColor: Colors.blue,)
              ],
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
