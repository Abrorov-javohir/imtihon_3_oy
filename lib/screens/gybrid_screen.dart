import 'package:flutter/material.dart';
import 'package:imtihon_3_oy/widget/custom_card_with_row.dart';

class GybridScreen extends StatefulWidget {
  const GybridScreen({super.key});

  @override
  State<GybridScreen> createState() => _GybridScreenState();
}

class _GybridScreenState extends State<GybridScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gybrid Car')),
      body: Column(
        children: [
          CustomCardWithRow(),
          CustomCardWithRow(),
          CustomCardWithRow(),
        ],
      ),
    );
  }
}
