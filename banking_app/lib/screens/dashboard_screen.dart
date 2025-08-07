import 'package:flutter/material.dart';
import 'package:banking_app/screens/send_money_screen.dart';
import 'package:banking_app/screens/recieve_money_screen.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        title: const Text(
          'My Bank',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Balance Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 12,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Total Balance',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '\$12,345.67',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),

            // Quick Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildActionButton(Icons.send, 'Send', context),
                _buildActionButton(Icons.download, 'Receive', context),
                _buildActionButton(Icons.receipt_long, 'Bills', context),
              ],
            ),

            SizedBox(height: 30),

            // Transactions
            const Text(
              'Recent Transactions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildTransactionTile(
                    'Starbucks',
                    '-\$5.50',
                    'Today',
                    Icons.local_cafe,
                  ),
                  _buildTransactionTile(
                    'Salary',
                    '+\$2,000.00',
                    'Yesterday',
                    Icons.attach_money,
                  ),
                  _buildTransactionTile(
                    'Netflix',
                    '-\$12.99',
                    'Aug 3',
                    Icons.tv,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildActionButton(
    IconData icon,
    String label,
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () {
        if (label == 'Send') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SendMoneyScreen()),
          );
        } else if (label == 'Receive') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ReceiveMoneyScreen()),
          );
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Feature coming soon")));
        }
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blueAccent.withOpacity(0.1),
            child: Icon(icon, size: 28, color: Colors.blueAccent),
          ),
          SizedBox(height: 8),
          Text(label, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  static Widget _buildTransactionTile(
    String title,
    String amount,
    String date,
    IconData icon,
  ) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blueAccent.withOpacity(0.1),
        child: Icon(icon, color: Colors.blueAccent),
      ),
      title: Text(title),
      subtitle: Text(date),
      trailing: Text(
        amount,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: amount.startsWith('-') ? Colors.red : Colors.green,
        ),
      ),
    );
  }
}
