import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> UserTransactions;
  final Function deleteTx;
  const TransactionList(this.UserTransactions, this.deleteTx, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserTransactions.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  Text(
                    'No transaction added yet!',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: UserTransactions.length,
            itemBuilder: (context, index) {
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
                        child: Text('\$${UserTransactions[index].amount}',
                            style: const TextStyle(
                              color: Colors.black,
                            )),
                      ),
                    ),
                  ),
                  title: Text(
                    UserTransactions[index].title,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(UserTransactions[index].date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 360
                      ? TextButton.icon(
                          icon: const Icon(Icons.delete),
                          onPressed: () => deleteTx(UserTransactions[index].id),
                          label: Text('Delete',
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.error)),
                          style: ButtonStyle(
                            iconColor: MaterialStateProperty.all(
                                Theme.of(context).colorScheme.error),
                          ),
                        )
                      : IconButton(
                          onPressed: () => deleteTx(UserTransactions[index].id),
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
            },
          );
  }
}
