
import 'package:flutter/material.dart';
import '../../utiil/size_config.dart';
Future<bool> showDialogWidget(BuildContext context) async {
  int selected=2;
  return await showDialog(
      barrierColor: Colors.green.shade200.withOpacity(0.5),
      barrierDismissible: false,
      context: context, builder: (context) {
    return AlertDialog(
      backgroundColor: Colors.green.shade50,
      title: Text('choose the language'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RadioListTile(value: 1,
              groupValue: selected,
              title: const Text('English'),
              onChanged: (int? value) {
                Navigator.pop(context, true);
              }),
          RadioListTile(value: 0,
              groupValue: selected,
              title: const Text('Arabic'),
              onChanged: (int? value) {
                Navigator.pop(context, false);
              }),
        ],
      ),
      titleTextStyle: TextStyle(
        fontSize: SizeConfig.scaleTextFont(22),
        color: Colors.black,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
      ),
      contentTextStyle: TextStyle(
          fontSize: SizeConfig.scaleTextFont(17),
          color: Colors.black26,
          fontWeight: FontWeight.w500,
          fontFamily: 'Roboto'
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(20),
      ),
    );
  });
}

