import 'package:get/get.dart';
import '../../model/stop_model.dart';
import '../view/details_view.dart';
import '../view/home_view.dart';

class AppRoutes {
  static const home = '/';
  static const detail = '/detail';

  static final routes = [
    GetPage(
      name: home,
      page: () => HomeView(),
    ),
    GetPage(
      name: detail,
      page: () {
        final stop = Get.arguments as StopModel;
        return DetailView(stop: stop);
      },
    ),
  ];
}
