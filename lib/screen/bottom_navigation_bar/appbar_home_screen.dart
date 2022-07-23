import 'package:flutter/material.dart';

import '../../utiil/size_config.dart';
import '../../widget/text_field_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class AppBarHomeScreen extends StatelessWidget {
  const AppBarHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10)
      ),
      margin: EdgeInsetsDirectional.only(top: SizeConfig.scaleHeight(20),end:SizeConfig.scaleHeight(12),start: SizeConfig.scaleHeight(12)),
      child: TextFieldWidget(text: AppLocalizations.of(context)!.search_note,prefixIcon: Icons.search),
    );
  }
}
