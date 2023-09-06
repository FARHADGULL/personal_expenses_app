import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      color: Theme.of(context).colorScheme.secondary,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text('Chart'),
      ),
    );
  }
}
