import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ird_app_zishan/core/routes/app_pages.dart';
import 'core/utils/colors.dart';
import 'modules/hadith/bindings/hadith_binding.dart';

void main() {
  runApp(const MyApp());
  SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple,),
        useMaterial3: true,
      ),
      initialBinding: HadithBinding(),
      getPages: AppPages.pages,
      initialRoute: AppPages.INITIAL,
    );
  }
}

