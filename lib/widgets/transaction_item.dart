import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.UserTransaction,
    required this.deleteTx,
  });

  final Transaction UserTransaction;
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
              child: Text('\$${UserTransaction.amount}',
                  style: const TextStyle(
                    color: Colors.black,
                  )),
            ),
          ),
        ),
        title: Text(
          UserTransaction.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(UserTransaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 360
            ? TextButton.icon(
                icon: const Icon(Icons.delete),
                onPressed: () => deleteTx(UserTransaction.id),
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
                onPressed: () => deleteTx(UserTransaction.id),
                icon: const Icon(Icons.delete),
                color: Theme.of(context).colorScheme.error,
              ),
      ),
    );
  }
}
