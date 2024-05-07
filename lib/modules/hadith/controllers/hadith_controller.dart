import 'dart:async';
import 'package:get/get.dart';
import 'package:ird_app_zishan/core/data/db.dart';

class HadithController extends GetxController {
  RxBool isDataLoading = false.obs;
  List booksResults = [];
  List chapterResults = [];
  List sectionResults = [];
  List hadithResults = [];

  @override
  Future<void> onInit() async {
    super.onInit();
    await getAllData();
  }

  Future<void> getAllData() async {
    isDataLoading.value = true;

    var db = await ExtractData().loadFromAsset();

    booksResults = await db.query('books');

    chapterResults = await db.query('chapter');

    sectionResults = await db.query('section');

    hadithResults = await db.query('hadith');

    isDataLoading.value = false;
  }

}
