import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReceiveMoneyScreen extends StatelessWidget {
  final String accountName = "Stallone Mathenge";
  final String accountNumber = "1234 5678 9012 3456";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Receive Funds"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Icon(
              Icons.account_balance_wallet_rounded,
              size: 80,
              color: Colors.blueAccent,
            ),
            SizedBox(height: 30),
            Text(
              "Your Account",
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            SizedBox(height: 10),
            Text(
              accountName,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            SelectableText(
              accountNumber,
              style: TextStyle(fontSize: 20, color: Colors.black87),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: accountNumber));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Account number copied!")),
                );
              },
              icon: Icon(Icons.copy),
              label: Text("Copy Account Number"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              ),
            ),
            SizedBox(height: 40),

            // Optional: Fake QR Code Box
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Text(
                "QR Code\n(Coming Soon)",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
