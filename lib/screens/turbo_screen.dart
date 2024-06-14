import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imtihon_3_oy/widget/turbo_car_card.dart';

class TurboScreen extends StatefulWidget {
  const TurboScreen({super.key});

  @override
  State<TurboScreen> createState() => _TurboScreenState();
}

class _TurboScreenState extends State<TurboScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Turbo Screen"),
      ),
      body: TurbCarCard(),
    );
  }
}
