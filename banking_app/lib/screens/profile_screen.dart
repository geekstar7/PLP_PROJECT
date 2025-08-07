import 'package:flutter/material.dart';
import 'package:banking_app/screens/transaction_history_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final String fullName = "Stallone Mathenge";
  final String email = "stallone@example.com";
  final String accountNumber = "1234 5678 9012 3456";

  bool isDarkMode = false;

  void toggleThemeMode() {
    setState(() {
      isDarkMode = !isDarkMode;
      final brightness = isDarkMode ? Brightness.dark : Brightness.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Color(0xFFF5F7FA),
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Icon(
              Icons.account_circle,
              size: 100,
              color: isDarkMode ? Colors.white : Colors.blueAccent,
            ),
            SizedBox(height: 20),
            Text(
              fullName,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            Text(
              email,
              style: TextStyle(
                color: isDarkMode ? Colors.white70 : Colors.grey[700],
              ),
            ),
            SizedBox(height: 20),
            Divider(color: isDarkMode ? Colors.white24 : Colors.grey[400]),
            ListTile(
              leading: Icon(Icons.numbers, color: Colors.blueAccent),
              title: Text(
                "Account Number",
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              subtitle: Text(
                accountNumber,
                style: TextStyle(
                  color: isDarkMode ? Colors.white70 : Colors.black87,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.history, color: Colors.blueAccent),
              title: Text(
                "Transaction History",
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => TransactionHistoryScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.dark_mode, color: Colors.blueAccent),
              title: Text(
                "Dark Mode",
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              trailing: Switch(
                value: isDarkMode,
                onChanged: (val) => toggleThemeMode(),
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text(
                "Log Out",
                style: TextStyle(
                  color: isDarkMode ? Colors.red[200] : Colors.red,
                ),
              ),
              onTap: () {
                Navigator.pop(context); // Simulated log out
              },
            ),
          ],
        ),
      ),
    );
  }
}
