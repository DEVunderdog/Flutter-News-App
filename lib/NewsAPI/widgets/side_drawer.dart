
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_news_app/NewsAPI/controller/news_controller.dart';
import 'package:the_news_app/NewsAPI/constants/color_constants.dart';
import 'package:the_news_app/NewsAPI/constants/size_constants.dart';
import 'package:the_news_app/NewsAPI/constants/ui_constants.dart';
import 'package:the_news_app/NewsAPI/widgets/dropdown_list.dart';
import 'package:the_news_app/NewsAPI/utils/utils.dart';


Drawer sideDrawer(NewsController newsController){
  return Drawer(
    backgroundColor: AppColors.lightGrey,
    child: ListView(
      children: [
        GetBuilder<NewsController>(
          builder: (controller){
            return Container(
              decoration: const BoxDecoration(
                color: AppColors.burgundy,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(Sizes.dimen_10),
                  bottomRight: Radius.circular(Sizes.dimen_10),
                ),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.dimen_18, vertical: Sizes.dimen_18
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  controller.cName.isNotEmpty ? Text(
                    "Country: ${controller.cName.value.toUpperCase()}",
                    style: const TextStyle(
                      color: AppColors.white, fontSize: Sizes.dimen_18
                    ),
                  ): const SizedBox.shrink(),
                  vertical15,
                  controller.channel.isNotEmpty ? Text(
                    "Category:${controller.channel.value.capitalizeFirst}",
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: Sizes.dimen_18
                    )
                  ): const SizedBox.shrink()
                ],
              ),
            );
          },
          init: NewsController(),
        ),
        ExpansionTile(
          collapsedTextColor: AppColors.burgundy,
          collapsedIconColor: AppColors.burgundy,
          iconColor: AppColors.burgundy,
          textColor: AppColors.burgundy,
          title: const Text("Select Country"),
          children: [
            for(int i = 0; i < listOfCountry.length; i++)
              drawerDropDown(
                onCalled: (){
                  newsController.country.value = listOfCountry[i]['code']!;
                  newsController.cName.value = listOfCountry[i]['name']!.toUpperCase();
                  newsController.getAllNews();
                  newsController.getBreakingNews();
                },
                name: listOfCountry[i]['name']!.toUpperCase(),
              )
          ],
        )
      ],
    ),
  );
}