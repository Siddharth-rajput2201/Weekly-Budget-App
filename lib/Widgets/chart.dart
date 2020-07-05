import 'package:budgetapp/Data_models/trasanction_class.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {

  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  List<Map<String,Object>>get groupedTransaction{
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days:index),);
      var totalsum = 0.0;

      for(var i = 0; i <recentTransaction.length ; i++)
        {
          if(recentTransaction[i].date.day == weekday.day &&
              recentTransaction[i].date.month == weekday.month &&
              recentTransaction[i].date.month == weekday.month )
            {
                totalsum += recentTransaction[i].amount;
            }
        }
      return{
        'day' : DateFormat.E().format(weekday),
        'amount': totalsum,
      };
      });
      //return {'DAY': DateFormat.E(weekday),'AMOUNT': 9.99 };});
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransaction);
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(25),
      child: Row(
        children: groupedTransaction.map((data) {
          return Text('${data['day']}: ${data['amount']}');
        }).toList(),
      ),
    );
  }
}
