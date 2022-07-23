import 'package:flutter/material.dart';
import '../../utiil/size_config.dart';
import '../elevated_button_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContainOnBoarding extends StatelessWidget {
  final String image;
  final String subTitle;
  final bool visible;

  ContainOnBoarding({
    required this.image,
    required this.subTitle,
    this.visible = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppLocalizations.of(context)!.welcome,
              style: TextStyle(
                  fontSize: SizeConfig.scaleTextFont(32),
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF0F0A39)),
            ),
            SizedBox(height: SizeConfig.scaleHeight(21)),
            Padding(
              padding:
                  EdgeInsetsDirectional.only(end: SizeConfig.scaleWidth(20)),
              child: Text(subTitle),
            ),
          ],
        ),
        Spacer(),
        Visibility(
          visible: visible,
          child: Column(
            children: [
              ElevatedButtonWidget(
                  text: AppLocalizations.of(context)!.log_in,
                  borderSide: Color(0xFF7C37FA),
                  onTape: (){
                    Navigator.pushReplacementNamed(context, '/log_in_screen');
                  },
              ),
              SizedBox(height: SizeConfig.scaleHeight(20)),
              ElevatedButtonWidget(
                text: AppLocalizations.of(context)!.sin_up,
                color: Color(0xFF7C37FA),
                textColor: Colors.white,
                onTape: (){
                  Navigator.pushReplacementNamed(context, '/sin_up_screen');
                },
              ),
              SizedBox(height: SizeConfig.scaleHeight(22)),
            ],
          ),
        ),
        Image.asset(
          image,
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      ],
    );
  }
}
