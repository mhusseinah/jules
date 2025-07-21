import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  final _transmissionController = TextEditingController();
  final _fuelTypeController = TextEditingController();
  final _mileageController = TextEditingController();
  List<XFile> _imageFiles = [];

  Future<void> _pickImage() async {
    final pickedFiles = await ImagePicker().pickMultiImage();
    setState(() {
      _imageFiles = pickedFiles;
    });
  }

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
            _imageFiles.isEmpty
                ? const Text('No images selected.')
                : SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _imageFiles.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.file(File(_imageFiles[index].path)),
                        );
                      },
                    ),
                  ),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Select Images'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _locationController,
              decoration: const InputDecoration(
                labelText: 'Location',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _transmissionController,
              decoration: const InputDecoration(
                labelText: 'Transmission',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _fuelTypeController,
              decoration: const InputDecoration(
                labelText: 'Fuel Type',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _mileageController,
              decoration: const InputDecoration(
                labelText: 'Mileage',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final car = Car(
                  brand: _brandController.text,
                  model: _modelController.text,
                  year: int.parse(_yearController.text),
                  price: int.parse(_priceController.text),
                  imageUrls: _imageFiles.map((e) => e.path).toList(),
                  location: _locationController.text,
                  transmission: _transmissionController.text,
                  fuelType: _fuelTypeController.text,
                  mileage: int.parse(_mileageController.text),
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
