import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ird_app_zishan/core/utils/colors.dart';
import 'package:ird_app_zishan/core/utils/constants.dart';
import 'package:ird_app_zishan/core/utils/helpers.dart';
import '../controllers/hadith_controller.dart';

class HadithDetailsPage extends GetView<HadithController> {
  const HadithDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Obx(
          () => controller.isDataLoading.value
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : NestedScrollView(
                  floatHeaderSlivers: true,
                  headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        backgroundColor: AppColors.primaryColor,
                        // expandedHeight: 65,
                        flexibleSpace: ListTile(
                          leading: const Icon(
                            CupertinoIcons.left_chevron,
                            color: Colors.white,
                          ),
                          title: Text(
                            controller.booksResults.isNotEmpty
                                ? controller.booksResults[0]['title']
                                : '',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                              fontFamily: bengaliFont,
                            ),
                          ),
                          subtitle: Text(
                            controller.chapterResults.isNotEmpty
                                ? controller.chapterResults[0]['title']
                                : '',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontFamily: bengaliFont,
                            ),
                          ),
                          trailing: Container(
                            height: 22,
                            width: 22,
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Image.asset(
                              menuIcon,
                              height: 16,
                              width: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        floating: true,
                        snap: true,
                        bottom: const PreferredSize(preferredSize: Size.fromHeight(10), child: SizedBox(),),
                      ),
                    ];
                  },
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          color: AppColors.primaryColor,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 20),
                            decoration: BoxDecoration(
                              color: AppColors.whiteBackgroundColor,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15.0),
                                topRight: Radius.circular(15.0),
                              ),
                            ),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: controller.sectionResults.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final map = controller.sectionResults[index];
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(1.0),
                                      padding: const EdgeInsets.all(15.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.1),
                                            blurRadius: 0.05,
                                            spreadRadius: 0.05,
                                          ),
                                        ],
                                      ),
                                      child: '${map['number'] ?? ''}' !=
                                              '${map['title'] ?? ''}'
                                          ? Column(
                                              children: [
                                                RichText(
                                                  text: TextSpan(
                                                    text:
                                                        '${map['number'] ?? ''} ',
                                                    style: TextStyle(
                                                      color: AppColors
                                                          .primaryColor,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16,
                                                      fontFamily: bengaliFont,
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            '${map['title'] ?? ''}',
                                                        style: TextStyle(
                                                          color: Colors.black
                                                              .withOpacity(0.6),
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 16,
                                                          fontFamily:
                                                              bengaliFont,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                                  child: Divider(
                                                    thickness: 0.2,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                Text(
                                                  '${map['preface'] ?? ''}',
                                                  style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontFamily: bengaliFont,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ],
                                            )
                                          : SizedBox(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Text(
                                                '${map['number'] ?? ''} ',
                                                style: TextStyle(
                                                  color: AppColors.primaryColor,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  fontFamily: bengaliFont,
                                                ),
                                              ),
                                            ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.all(1.0),
                                      padding: const EdgeInsets.all(15.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.1),
                                            blurRadius: 0.05,
                                            spreadRadius: 0.05,
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          ListTile(
                                            contentPadding: EdgeInsets.zero,
                                            leading: Container(
                                              height: 40,
                                              width: 40,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                    shapeBox,
                                                  ),
                                                ),
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                Helpers()
                                                    .firstLettersOfBook(
                                                        controller
                                                                .booksResults[0]
                                                            ['book_name'])
                                                    .toUpperCase(),
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontFamily: bengaliFont,
                                                ),
                                              ),
                                            ),
                                            title: Text(
                                              controller.booksResults.isNotEmpty
                                                  ? controller.booksResults[0]
                                                      ['title']
                                                  : '',
                                              style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.6),
                                                fontWeight: FontWeight.bold,
                                                fontFamily: bengaliFont,
                                              ),
                                            ),
                                            subtitle: Text(
                                              "হাদীস ${Helpers().replaceBengaliNumber(controller.hadithResults[index]['hadith_id'].toString())}",
                                              style: const TextStyle(
                                                color: Colors.green,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: bengaliFont,
                                              ),
                                            ),
                                            trailing: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                GestureDetector(
                                                  child: Container(
                                                    height: 20,
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 8,
                                                      vertical: 2,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Colors.green,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                    ),
                                                    child: const Text(
                                                      'সহিহ হাদীস',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 13,
                                                        fontFamily: bengaliFont,
                                                      ),
                                                    ),
                                                  ),
                                                  onTap: () {},
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                const Icon(
                                                  Icons.more_vert,
                                                  color: Colors.grey,
                                                  size: 22,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            controller.hadithResults[index]
                                                ['ar'],
                                            style: const TextStyle(
                                              fontSize: 21,
                                              fontFamily: arabicFont,
                                              height: 2,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            '${controller.hadithResults[index]['narrator']} থেকে বর্ণিতঃ',
                                            style: const TextStyle(
                                              color: Colors.green,
                                              fontSize: 17,
                                              fontFamily: bengaliFont,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            controller.hadithResults[index]
                                                ['bn'],
                                            style: const TextStyle(
                                              fontSize: 17,
                                              height: 1.5,
                                              fontFamily: bengaliFont,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
