import 'package:flutter/material.dart';
import 'package:imtihon_3_oy/screens/chat_screen.dart';
import 'package:imtihon_3_oy/screens/homescreen.dart';
import 'package:imtihon_3_oy/screens/profile_screen.dart';
import 'package:imtihon_3_oy/view_model/favourites_view_model.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Favorites'),
      ),
      body: Card(
        child: Consumer<FavoritesViewModel>(
          builder: (context, favoritesViewModel, child) {
            final favorites = favoritesViewModel.favorites;
            return ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(favorites[index].imageUrl),
                  title: Text(favorites[index].title),
                  subtitle: Text('\$${favorites[index].price}'),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      favoritesViewModel.removeFromFavorites(favorites[index]);
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.message),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatScreen()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.favorite, color: Colors.blue, size: 30),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FavoritesPage()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
