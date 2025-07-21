import 'package:flutter/material.dart';
import 'package:souq_cars/add_car_screen.dart';
import 'package:souq_cars/chat_screen.dart';
import 'package:souq_cars/favorites_screen.dart';
import 'package:souq_cars/login_screen.dart';
import 'package:souq_cars/signup_screen.dart';
import 'car.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Car> _cars = [
    Car(
      brand: 'Toyota',
      model: 'Camry',
      year: 2021,
      price: 25000,
      imageUrl: 'assets/images/placeholder.png',
      location: 'New York',
    ),
    Car(
      brand: 'Honda',
      model: 'Civic',
      year: 2022,
      price: 22000,
      imageUrl: 'assets/images/placeholder.png',
      location: 'Los Angeles',
    ),
    Car(
      brand: 'Ford',
      model: 'Mustang',
      year: 2020,
      price: 45000,
      imageUrl: 'assets/images/placeholder.png',
      location: 'New York',
    ),
  ];
  List<Car> _filteredCars = [];
  String _searchText = '';
  final List<Car> _favoriteCars = [];

  @override
  void initState() {
    super.initState();
    _filteredCars = _cars;
  }

  void _filterCars() {
    setState(() {
      _filteredCars = _cars.where((car) {
        return car.brand.toLowerCase().contains(_searchText.toLowerCase()) ||
            car.model.toLowerCase().contains(_searchText.toLowerCase());
      }).toList();
    });
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Filter by Price'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Min Price',
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Max Price',
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Location',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // TODO: Implement price and location filtering
                Navigator.pop(context);
              },
              child: const Text('Apply'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Souq Cars'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      FavoritesScreen(favoriteCars: _favoriteCars),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.login),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.person_add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignupScreen()),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddCarScreen(
                onCarAdded: (car) {
                  setState(() {
                    _cars.add(car);
                    _filterCars();
                  });
                },
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        _searchText = value;
                        _filterCars();
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Search for cars...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {
                    _showFilterDialog();
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredCars.length,
              itemBuilder: (context, index) {
                final car = _filteredCars[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: car.imageUrl.startsWith('http')
                        ? Image.network(car.imageUrl)
                        : Image.asset(car.imageUrl),
                    title: Text('${car.brand} ${car.model}'),
                    subtitle: Text('Year: ${car.year} - Price: \$${car.price}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: _favoriteCars.contains(car)
                              ? const Icon(Icons.favorite)
                              : const Icon(Icons.favorite_border),
                          onPressed: () {
                            setState(() {
                              if (_favoriteCars.contains(car)) {
                                _favoriteCars.remove(car);
                              } else {
                                _favoriteCars.add(car);
                              }
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.chat),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ChatScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
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
