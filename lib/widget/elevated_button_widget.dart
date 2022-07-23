import 'package:flutter/material.dart';

import '../utiil/size_config.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? textColor;
  final Color? borderSide;
  final Function()? onTape;
  final String? image;
  final double? width;

  ElevatedButtonWidget({
    required this.text,
    this.color,
    this.borderSide,
    this.textColor,
    this.onTape,
    this.image,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTape,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: color ?? Colors.white,
        minimumSize: Size(width??double.infinity, SizeConfig.scaleHeight(44)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: borderSide != null
              ? BorderSide(
                  color: Color(0xFF7C37FA),
                )
              : BorderSide.none,
        ),
      ),
      child: image==null?Text(
        text,
        style: TextStyle(
            fontSize: SizeConfig.scaleTextFont(16),
            color: textColor ?? Color(0xFF7C37FA)),
      ):Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image!),
          SizedBox(width: SizeConfig.scaleWidth(20)),
          Text(
            text,
            style: TextStyle(
                fontSize: SizeConfig.scaleTextFont(16),
                color: textColor ?? Color(0xFF7C37FA)),
          ),
        ],
      ),
    );
  }
}
