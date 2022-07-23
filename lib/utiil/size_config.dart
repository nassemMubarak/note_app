import 'package:flutter/material.dart';
class SizeConfig{
  static double? screenWidth;
  static double? _screenHeight;
  static double _blockWidth=0;
  static double _blockHeight=0 ;

  static double? _textMultiplier;
  static double? _imageSizeMultiplier;
  static double? _heightMultiplier;
  static double? _widthMultiplier;
  static double? _deviceRatio;

  static MediaQueryData? _mediaQueryData;
  void init(BuildContext context){
    _mediaQueryData =  MediaQuery.of(context);
    screenWidth =  _mediaQueryData!.size.width;
    _screenHeight = _mediaQueryData?.size.height;

    _blockWidth = screenWidth!/100;
    _blockHeight = _screenHeight!/100;

    _textMultiplier = _blockHeight;
    _imageSizeMultiplier = _blockWidth;
    _heightMultiplier = _blockHeight;
    _widthMultiplier = _blockWidth;
    _deviceRatio = screenWidth!/_screenHeight!;

  }
  static double scaleTextFont(double fontSize){
    double scal = fontSize/8.96;
    return(_textMultiplier!*scal);
  }
  static double scaleWidth(double width){
    double scal = width/3.75;
    return(_widthMultiplier! * scal);
  }
  static double scaleHeight(double height){
    double scal = height/8.12;
    return(_heightMultiplier! * scal);
  }


}