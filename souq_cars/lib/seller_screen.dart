import 'package:flutter/material.dart';
import 'package:souq_cars/car.dart';

class SellerScreen extends StatelessWidget {
  final List<Car> cars;

  const SellerScreen({super.key, required this.cars});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seller Profile'),
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
                  'Seller Name',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text('seller@example.com'),
              ],
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'My Listings',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cars.length,
              itemBuilder: (context, index) {
                final car = cars[index];
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
