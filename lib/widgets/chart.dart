import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;
  const Chart(this.recentTransaction, {super.key});

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(
      7,
      (index) {
        final weekDay = DateTime.now().subtract(Duration(days: index));
        double totalSum = 0.0;
        for (var i in recentTransaction) {
          if (i.date.day == weekDay.day &&
              i.date.month == weekDay.month &&
              i.date.year == weekDay.year) {
            totalSum += i.amount;
          }
        }

        // for (var i = 0; i < recentTransaction.length; i++) {
        //   if (recentTransaction[i].date.day == weekDay.day &&
        //       recentTransaction[i].date.month == weekDay.month &&
        //       recentTransaction[i].date.year == weekDay.year) {
        //     totalSum += recentTransaction[i].amount;
        //   }
        // }
        print(DateFormat.E(weekDay));
        print(totalSum);
        return {'day': DateFormat.E(weekDay), 'amount': totalSum};
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      color: Theme.of(context).colorScheme.secondary,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(),
      ),
    );
  }
}