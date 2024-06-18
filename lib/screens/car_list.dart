import 'package:flutter/material.dart';
import 'package:imtihon_3_oy/view_model/favourites_view_model.dart';
import 'package:provider/provider.dart';

class CarList extends StatelessWidget {
  const CarList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Car List'),
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
    );
  }
}
