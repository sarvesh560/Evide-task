import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/stop_controller.dart';
import '../widgets/stop_tile.dart';
import 'details_view.dart';

class HomeView extends StatelessWidget {
  final StopController controller = Get.put(StopController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurple,
        title: const Text("🚏 Bus Stops", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search stops...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) => controller.searchQuery.value = value,
            ),
          ),

          // List of stops
          Expanded(
            child: Obx(() {
              if (controller.stops.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
              if (controller.filteredStops.isEmpty) {
                return const Center(child: Text("No stops found 😔"));
              }
              return ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: controller.filteredStops.length,
                itemBuilder: (context, index) {
                  final stop = controller.filteredStops[index];
                  return Hero(
                    tag: stop.stopname,
                    child: StopTile(
                      stop: stop,
                      isFavorite: controller.favorites.contains(stop.stopname),
                      onTap: () {
                        Get.to(() => DetailView(stop: stop),
                            transition: Transition.cupertino);
                      },
                      onFavTap: () => controller.toggleFavorite(stop.stopname),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
