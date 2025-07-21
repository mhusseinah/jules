import 'package:flutter/material.dart';
import 'package:souq_cars/car.dart';

class AddCarScreen extends StatefulWidget {
  final Function(Car) onCarAdded;

  const AddCarScreen({super.key, required this.onCarAdded});

  @override
  State<AddCarScreen> createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCarScreen> {
  final _brandController = TextEditingController();
  final _modelController = TextEditingController();
  final _yearController = TextEditingController();
  final _priceController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Car'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _brandController,
              decoration: const InputDecoration(
                labelText: 'Brand',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _modelController,
              decoration: const InputDecoration(
                labelText: 'Model',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _yearController,
              decoration: const InputDecoration(
                labelText: 'Year',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(
                labelText: 'Price',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _imageUrlController,
              decoration: const InputDecoration(
                labelText: 'Image URL',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Location',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final car = Car(
                  brand: _brandController.text,
                  model: _modelController.text,
                  year: int.parse(_yearController.text),
                  price: int.parse(_priceController.text),
                  imageUrl: _imageUrlController.text,
                  location: _locationController.text,
                );
                widget.onCarAdded(car);
                Navigator.pop(context);
              },
              child: const Text('Add Car'),
            ),
          ],
        ),
      ),
    );
  }
}
