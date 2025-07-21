import 'package:flutter/material.dart';
import 'package:souq_cars/car.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Car> favoriteCars;

  const FavoritesScreen({super.key, required this.favoriteCars});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Cars'),
      ),
      body: ListView.builder(
        itemCount: favoriteCars.length,
        itemBuilder: (context, index) {
          final car = favoriteCars[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.network(car.imageUrl),
              title: Text('${car.brand} ${car.model}'),
              subtitle: Text('Year: ${car.year} - Price: \$${car.price}'),
            ),
          );
        },
      ),
    );
  }
}
