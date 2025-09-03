import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../constants/app_values.dart';
import '../extensions/screen_util_helper.dart';
import '../model/stop_model.dart';

class DetailView extends StatelessWidget {
  final StopModel stop;
  const DetailView({Key? key, required this.stop}) : super(key: key);

  String get eta => "${stop.timedifference * 2} mins";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(stop.stopname, style: AppTextStyles.appBarTitle.copyWith(fontSize: ScreenUtilHelper.fontSize(18))),
        backgroundColor: AppColors.primary,
        elevation: AppValues.elevationAppBar,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(ScreenUtilHelper.width(AppValues.paddingMedium)),
        child: Column(
          children: [
            Hero(
              tag: stop.stopname,
              child: Container(
                height: ScreenUtilHelper.height(180),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(ScreenUtilHelper.radius(AppValues.borderRadiusLarge)),
                  gradient: const LinearGradient(
                    colors: [AppColors.primary, AppColors.accent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(stop.stopname, style: AppTextStyles.heroTitle.copyWith(fontSize: ScreenUtilHelper.fontSize(22))),
              ),
            ),
            SizedBox(height: ScreenUtilHelper.height(AppValues.paddingLarge)),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(ScreenUtilHelper.radius(AppValues.borderRadiusMedium)),
              ),
              child: ListTile(
                leading: const Icon(Icons.location_on, color: AppColors.primary),
                title: Text("Latitude: ${stop.latitude}", style: AppTextStyles.title.copyWith(fontSize: ScreenUtilHelper.fontSize(16))),
                subtitle: Text("Longitude: ${stop.longitude}", style: AppTextStyles.subtitle.copyWith(fontSize: ScreenUtilHelper.fontSize(14))),
              ),
            ),

            SizedBox(height: ScreenUtilHelper.height(AppValues.paddingMedium)),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(ScreenUtilHelper.radius(AppValues.borderRadiusMedium)),
              ),
              child: ListTile(
                leading: const Icon(Icons.timer, color: AppColors.primary),
                title: Text("Estimated Time Arrival", style: AppTextStyles.title.copyWith(fontSize: ScreenUtilHelper.fontSize(16))),
                subtitle: Text(
                  eta,
                  style: AppTextStyles.subtitle.copyWith(
                    fontSize: ScreenUtilHelper.fontSize(14),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
