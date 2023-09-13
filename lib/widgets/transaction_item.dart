import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.userTransaction,
    required this.deleteTx,
  });

  final Transaction userTransaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          //add color to the avatar
          backgroundColor: Theme.of(context).colorScheme.primary,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text('\$${userTransaction.amount}',
                  style: const TextStyle(
                    color: Colors.black,
                  )),
            ),
          ),
        ),
        title: Text(
          userTransaction.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(userTransaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 360
            ? TextButton.icon(
                icon: const Icon(Icons.delete),
                onPressed: () => deleteTx(userTransaction.id),
                label: Text(
                  'Delete',
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
                style: ButtonStyle(
                  iconColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.error),
                ),
              )
            : IconButton(
                onPressed: () => deleteTx(userTransaction.id),
                icon: const Icon(Icons.delete),
                color: Theme.of(context).colorScheme.error,
              ),
      ),
    );

    //   return Card(
    //     child: Row(
    //       children: [
    //         Container(
    //           margin: const EdgeInsets.symmetric(
    //             vertical: 10,
    //             horizontal: 15,
    //           ),
    //           decoration: BoxDecoration(
    //             border: Border.all(
    //               color: Theme.of(context).primaryColor,
    //               width: 2,
    //             ),
    //           ),
    //           padding: const EdgeInsets.all(10),
    //           child: Text(
    //             '\$${UserTransactions[index].amount.toStringAsFixed(2)}',
    //             style: const TextStyle(
    //               fontWeight: FontWeight.bold,
    //               fontSize: 20,
    //               color: Colors.purple,
    //             ),
    //           ),
    //         ),
    //         Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text(UserTransactions[index].title,
    //                 style: Theme.of(context).textTheme.titleMedium),
    //             Text(
    //               DateFormat.yMMMd()
    //                   .format(UserTransactions[index].date),
    //               style: const TextStyle(
    //                 color: Colors.grey,
    //               ),
    //             ),
    //           ],
    //         )
    //       ],
    //     ),
    //   );
  }
}
