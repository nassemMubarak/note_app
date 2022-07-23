import 'package:flutter/material.dart';

class ControllerProviderLanguage extends ChangeNotifier{
  String language = 'en';
  void changLanguage(String lang){
    language = lang;
    notifyListeners();
  }
}