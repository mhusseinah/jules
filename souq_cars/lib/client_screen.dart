import 'package:flutter/material.dart';
import 'package:souq_cars/car.dart';

class ClientScreen extends StatelessWidget {
  final List<Car> favoriteCars;

  const ClientScreen({super.key, required this.favoriteCars});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  child: Icon(Icons.person, size: 50),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Client Name',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text('client@example.com'),
              ],
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'My Favorites',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: favoriteCars.length,
              itemBuilder: (context, index) {
                final car = favoriteCars[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Image.asset(car.imageUrl),
                    title: Text('${car.brand} ${car.model}'),
                    subtitle: Text('Year: ${car.year} - Price: \$${car.price}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
