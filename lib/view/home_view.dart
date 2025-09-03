import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../constants/app_values.dart';
import '../controller/stop_controller.dart';
import '../extensions/screen_util_helper.dart';
import '../widgets/stop_tile.dart';
import 'details_view.dart';

class HomeView extends StatelessWidget {
  final StopController controller = Get.put(StopController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: AppValues.elevationAppBar,
        backgroundColor: AppColors.primary,
        title: Text("🚏 Bus Stops", style: AppTextStyles.appBarTitle.copyWith(fontSize: ScreenUtilHelper.fontSize(18))),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(ScreenUtilHelper.radius(AppValues.borderRadiusLarge))),
        ),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: EdgeInsets.all(ScreenUtilHelper.width(AppValues.paddingMedium)),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search stops...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: AppColors.white,
                contentPadding: EdgeInsets.symmetric(
                  vertical: ScreenUtilHelper.height(AppValues.paddingSmall),
                  horizontal: ScreenUtilHelper.width(AppValues.paddingMedium),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(ScreenUtilHelper.radius(30)),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) => controller.searchQuery.value = value,
            ),
          ),

          Expanded(
            child: Obx(() {
              if (controller.stops.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
              if (controller.filteredStops.isEmpty) {
                return Center(
                  child: Text("No stops found 😔", style: AppTextStyles.subtitle.copyWith(fontSize: ScreenUtilHelper.fontSize(14))),
                );
              }
              return ListView.builder(
                padding: EdgeInsets.all(ScreenUtilHelper.width(AppValues.paddingMedium)),
                itemCount: controller.filteredStops.length,
                itemBuilder: (context, index) {
                  final stop = controller.filteredStops[index];
                  return Hero(
                    tag: stop.stopname,
                    child: StopTile(
                      stop: stop,
                      isFavorite: controller.favorites.contains(stop.stopname),
                      onTap: () {
                        Get.to(() => DetailView(stop: stop), transition: Transition.cupertino);
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
