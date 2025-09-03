import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../constants/app_values.dart';
import '../extensions/screen_util_helper.dart';
import '../model/stop_model.dart';

class StopTile extends StatelessWidget {
  final StopModel stop;
  final bool isFavorite;
  final VoidCallback onTap;
  final VoidCallback onFavTap;

  const StopTile({
    Key? key,
    required this.stop,
    required this.isFavorite,
    required this.onTap,
    required this.onFavTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(ScreenUtilHelper.radius(AppValues.borderRadiusMedium))),
      elevation: AppValues.elevationCard,
      margin: EdgeInsets.symmetric(vertical: ScreenUtilHelper.height(AppValues.paddingSmall)),
      child: ListTile(
        contentPadding: EdgeInsets.all(ScreenUtilHelper.width(AppValues.paddingMedium)),
        title: Text(stop.stopname, style: AppTextStyles.title.copyWith(fontSize: ScreenUtilHelper.fontSize(16))),
        subtitle: Row(
          children: [
            const Icon(Icons.timer, size: 16, color: AppColors.grey),
            SizedBox(width: ScreenUtilHelper.width(AppValues.paddingSmall)),
            Chip(
              label: Text("ETA ~ ${stop.timedifference * 2} mins", style: AppTextStyles.chipText.copyWith(fontSize: ScreenUtilHelper.fontSize(12))),
              backgroundColor: AppColors.primary.withOpacity(0.1),
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(
            isFavorite ? Icons.star : Icons.star_border,
            color: AppColors.star,
            size: ScreenUtilHelper.scaleAll(28),
          ),
          onPressed: onFavTap,
        ),
        onTap: onTap,
      ),
    );
  }
}
