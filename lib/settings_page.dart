import 'package:flutter/material.dart';
import '../storage.dart';

class SettingsPage extends StatelessWidget {
  Future<void> handleLogout(BuildContext context) async {
    await Storage.logout();
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => handleLogout(context),
        child: Text("Logout"),
      ),
    );
  }
}
