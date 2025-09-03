import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../model/stop_model.dart';
import '../services/storage_services.dart';

class StopController extends GetxController {
  var stops = <StopModel>[].obs;
  var favorites = <String>[].obs;
  var searchQuery = ''.obs;

  final StorageService storage = StorageService();

  @override
  void onInit() {
    super.onInit();
    loadStops();
    loadFavorites();
  }

  Future<void> loadStops() async {
    final String response = await rootBundle.loadString('assets/mock/stops.json');
    final data = json.decode(response) as List;
    stops.value = data.map((e) => StopModel.fromJson(e)).toList();
  }

  Future<void> loadFavorites() async {
    favorites.value = await storage.getFavorites();
  }

  void toggleFavorite(String stopName) {
    if (favorites.contains(stopName)) {
      favorites.remove(stopName);
    } else {
      favorites.add(stopName);
    }
    storage.saveFavorites(favorites);
  }

  List<StopModel> get filteredStops {
    if (searchQuery.isEmpty) return stops;
    return stops
        .where((stop) =>
        stop.stopname.toLowerCase().contains(searchQuery.value.toLowerCase()))
        .toList();
  }
}
