import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = false;
  bool isFaceIdEnabled = false;

  @override
  void initState() {
    super.initState();
    // Get the initial theme mode
    AdaptiveTheme.getThemeMode().then((mode) {
      setState(() {
        isDarkMode = mode == AdaptiveThemeMode.dark;
      });
    });
  }

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
    if (isDarkMode) {
      AdaptiveTheme.of(context).setDark();
    } else {
      AdaptiveTheme.of(context).setLight();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Dark Mode"),
                Switch(
                  value: isDarkMode,
                  onChanged: (value) {
                    toggleTheme();
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Face ID"),
                Switch(
                  value: isFaceIdEnabled,
                  onChanged: (value) {
                    setState(() {
                      isFaceIdEnabled = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {
                // Google Authenticator settings page navigation
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text("Google Authenticator"),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward_ios),
                  )
                ],
              ),
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                // Change PIN action
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50), // Button size
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                backgroundColor: Colors.blue, // Button background color
              ),
              child: const Text(
                "Change Pin",
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Change Password action
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50), // Button size
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                backgroundColor: Colors.blue, // Button background color
              ),
              child: const Text(
                "Change Password",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
