
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;
  const TransactionList(this.transactions, this.onRemove, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: ((context, constraints) {
              return Column(
                children: [
                  SizedBox(height: constraints.maxHeight * 0.02),
                  Container(
                    height: constraints.maxHeight * 0.1,
                    child: Text(
                      'Nenhuma Transação Cadastrada!',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.02),
                  SizedBox(
                    height: constraints.maxHeight * 0.5,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            }),
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final tr = transactions[index];
              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.purple,
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text(
                          'R\$${tr.value}',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    tr.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat('d MMM y').format(tr.date),
                  ),
                  trailing: IconButton(
                    onPressed: (() => onRemove(tr.id)),
                    icon: Icon(Icons.delete),
                    color: Colors.red,
                  ),
                ),
              );
            },
          );
  }
}
