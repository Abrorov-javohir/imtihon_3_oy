import 'package:flutter/material.dart';
import 'package:imtihon_3_oy/screens/favoritescreen.dart';
import 'package:imtihon_3_oy/screens/homescreen.dart';
import 'package:imtihon_3_oy/view_model/favourites_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoritesViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/favorites': (context) => const FavoritesPage(),
        },
      ),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cars')),
      body: const Center(child: HomeScreen()),
    );
  }
}
