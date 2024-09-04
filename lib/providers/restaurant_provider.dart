import 'package:search_feature/models/restaurant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//The given JSON is converted into the List Type and initialized with the help of Restaurant Class Constructor.

const List<Restaurant> allRestaurants = [
  Restaurant(id: 1, name: "The Smokehouse", cuisine: "Barbecue"),
  Restaurant(id: 2, name: "Pinocchio's Pizza", cuisine: "Italian"),
  Restaurant(id: 3, name: "Felipe's Taqueria", cuisine: "Mexican"),
  Restaurant(id: 4, name: "Tasty Burger", cuisine: "American"),
];

//The provider is created which return all the items in the allRestaurants.
final restaurantProvider = Provider((ref) {
  return allRestaurants;
});

// The state provider with null is created which is used for search Bar functionality
final searchProvider = StateProvider((ref) => "");

//Search Bar functionality

final filteredRestaurants = Provider<List<Restaurant>>((ref) {
  final restaurants = ref.watch(restaurantProvider);
  final searchQuery = ref.watch(searchProvider).toLowerCase();

  if (searchQuery.isEmpty) {
    return restaurants;
  } else {
    return restaurants
        .where(
            (restaurant) => restaurant.name.toLowerCase().contains(searchQuery))
        .toList();
  }
});
