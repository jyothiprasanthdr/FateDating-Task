import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_feature/providers/restaurant_provider.dart';

class RestaurantListScreen extends ConsumerWidget {
  const RestaurantListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurants = ref.watch(filteredRestaurants);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurants'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search restaurants',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => ref.read(searchProvider.notifier).state =
                  value, // Here the searchProvider look for any change in the search bar.
            ),
          ),
          Expanded(
            child: restaurants.isEmpty
                ? const Center(child: Text('No restaurants available'))
                : ListView.builder(
                    itemCount: restaurants.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(restaurants[index].name),
                        subtitle: Text(restaurants[index].cuisine),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
