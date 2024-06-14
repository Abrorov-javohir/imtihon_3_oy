import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imtihon_3_oy/widget/classic_car_card.dart';
import 'package:imtihon_3_oy/widget/custom_card_with_row.dart';

class RecomendationScreen extends StatefulWidget {
  const RecomendationScreen({super.key});

  @override
  State<RecomendationScreen> createState() => _RecomendationScreenState();
}

class _RecomendationScreenState extends State<RecomendationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recomendation Screen'),
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
