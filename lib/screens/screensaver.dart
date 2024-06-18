import 'package:flutter/material.dart';
import 'package:imtihon_3_oy/screens/homescreen.dart';

class Screensaver extends StatefulWidget {
  const Screensaver({super.key});

  @override
  _ScreensaverState createState() => _ScreensaverState();
}

class _ScreensaverState extends State<Screensaver> {
  @override
  void initState() {
    super.initState();
    _navigateToNextPage();
  }

  Future<void> _navigateToNextPage() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Image.asset(
            "assets/AUDI.png",
            width: 300.0,
            height: 300.0,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
