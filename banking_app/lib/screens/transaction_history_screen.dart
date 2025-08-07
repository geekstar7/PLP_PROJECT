import 'package:flutter/material.dart';

class TransactionHistoryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> transactions = [
    {
      'title': 'Starbucks',
      'amount': -5.50,
      'date': 'Today',
      'icon': Icons.local_cafe,
    },
    {
      'title': 'Salary',
      'amount': 2000.00,
      'date': 'Yesterday',
      'icon': Icons.attach_money,
    },
    {'title': 'Netflix', 'amount': -12.99, 'date': 'Aug 3', 'icon': Icons.tv},
    {
      'title': 'Groceries',
      'amount': -56.23,
      'date': 'Aug 2',
      'icon': Icons.shopping_cart,
    },
    {
      'title': 'Gym Membership',
      'amount': -45.00,
      'date': 'Aug 1',
      'icon': Icons.fitness_center,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transaction History"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final tx = transactions[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blueAccent.withOpacity(0.1),
                child: Icon(tx['icon'], color: Colors.blueAccent),
              ),
              title: Text(tx['title']),
              subtitle: Text(tx['date']),
              trailing: Text(
                "${tx['amount'] < 0 ? '-' : '+'}\$${tx['amount'].abs().toStringAsFixed(2)}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: tx['amount'] < 0 ? Colors.red : Colors.green,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
