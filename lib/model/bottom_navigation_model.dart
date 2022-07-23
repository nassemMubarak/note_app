import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class BottomNavigationModel {
  final Widget widget;
  final Widget? appBarTitleWidget;

  const BottomNavigationModel({
   required this.widget,
    this.appBarTitleWidget,
  });
}
