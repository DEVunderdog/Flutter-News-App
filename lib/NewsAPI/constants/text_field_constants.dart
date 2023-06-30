import 'package:flutter/material.dart';
import 'package:the_news_app/NewsAPI/constants/color_constants.dart';
import 'package:the_news_app/NewsAPI/constants/size_constants.dart';

const kTextInputDecoration = InputDecoration(
  labelStyle: TextStyle(
    color: AppColors.lightGrey
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.lightGrey, width: 1.5),
    borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_10))

  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.lightGrey, width: 1.5),
    borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_10))
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 1.5),
    borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_10))
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 1.5),
    borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_10))
  )
);