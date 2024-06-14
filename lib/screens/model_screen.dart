import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imtihon_3_oy/widget/classic_car_card.dart';
import 'package:imtihon_3_oy/widget/custom_card_with_row.dart';

class ModelScreen extends StatefulWidget {
  const ModelScreen({super.key});

  @override
  State<ModelScreen> createState() => _ModelScreenState();
}

class _ModelScreenState extends State<ModelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Model Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClassCarCard(),
            CustomCardWithRow(),
            CustomCardWithRow(),
            CustomCardWithRow()
          ],
        ),
      ),
    );
  }
}
