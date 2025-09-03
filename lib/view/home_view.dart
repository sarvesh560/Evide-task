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
      appBar: AppBar(
        title: const Text("Bus Stops"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              decoration: const InputDecoration(
                  labelText: "Search stops", border: OutlineInputBorder()),
              onChanged: (value) => controller.searchQuery.value = value,
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.stops.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                itemCount: controller.filteredStops.length,
                itemBuilder: (context, index) {
                  final stop = controller.filteredStops[index];
                  return StopTile(
                    stop: stop,
                    isFavorite: controller.favorites.contains(stop.stopname),
                    onTap: () {
                      Get.to(() => DetailView(stop: stop));
                    },
                    onFavTap: () => controller.toggleFavorite(stop.stopname),
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
