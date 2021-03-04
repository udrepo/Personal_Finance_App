import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'transactionItem.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;


  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
          return Column(
        children: <Widget>[
          Text('nothing to show'),
          SizedBox(
            height: constraints.maxHeight* 0.2,
          ),
          Container(
              height: constraints.maxHeight * 0.6,
              child: Image.asset(
                'assets/images/waiting.png',
                fit: BoxFit.cover,
              ))
        ],
      );
    })
        : ListView.builder(
      itemBuilder: (context, index) {
        return TransactionItem(transaction: transactions[index], deleteTransaction: deleteTransaction);
      },
      itemCount: transactions.length,
    );
  }
}
