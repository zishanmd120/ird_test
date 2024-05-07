import 'package:get/get.dart';
import 'package:ird_app_zishan/core/routes/app_routes.dart';
import '../../modules/hadith/bindings/hadith_binding.dart';
import '../../modules/hadith/views/hadith_details_page.dart';

class AppPages{

  static String INITIAL = AppRoutes.hadithDetailScreen;

  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.hadithDetailScreen,
      page: () => const HadithDetailsPage(),
      binding: HadithBinding(),
    ),
  ];

}