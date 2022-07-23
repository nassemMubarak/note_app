import 'package:flutter/material.dart';

import '../../utiil/size_config.dart';

class IndicatorOnBoarding extends StatelessWidget {
  final bool selected;
  final double margenEnd;

  IndicatorOnBoarding({
    required this.selected,
    this.margenEnd = 8,
  });

  @override
  Widget build(BuildContext context) {
    return selected==true?Container(
      margin: EdgeInsetsDirectional.only(end: SizeConfig.scaleWidth(7.5)),
      width: SizeConfig.scaleWidth(20),
      height: SizeConfig.scaleHeight(20),
      padding: EdgeInsets.all(SizeConfig.scaleHeight(2)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color(0xFF7C37FA),
          width: SizeConfig.scaleHeight(4),
        ),
      ),
      child: Container(
        width: SizeConfig.scaleWidth(10),
        height: SizeConfig.scaleHeight(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Color(0xFF7C37FA),
          border: Border.all(color: Color(0xFF7C37FA)),
        ),
      ),

    ):
    Container(
      margin: EdgeInsetsDirectional.only(end: SizeConfig.scaleWidth(7.5)),
      width: SizeConfig.scaleWidth(10),
      height: SizeConfig.scaleHeight(10),
      decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
        color: Color(0xFFCBC9D9),
      ),
    );
  }
}
