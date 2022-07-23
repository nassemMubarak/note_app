import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../utiil/size_config.dart';
class TextFieldWidget extends StatelessWidget {
  final String text;
  final String? textError;
  final IconData? sufixIcon;
  final IconData? prefixIcon;
  final double? height;
  final double? width;
  final TextEditingController? textEditingController;
  final Function()? onTape;
  final bool? obscureText;
  final Function(String)? onChange;
  final TextInputType? textInputType;

  TextFieldWidget({
    required this.text,
    this.sufixIcon,
    this.prefixIcon,
    this.height,
    this.width,
    this.textEditingController,
    this.onTape,
    this.obscureText,
    this.textError,
    this.onChange,
    this.textInputType,
  });
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: SizeConfig.scaleHeight(height??80),
      width: SizeConfig.scaleHeight(width??double.infinity),
      child: TextField(
        keyboardType: textInputType,
        onChanged: onChange,
        controller: textEditingController,
        obscureText: obscureText??false,
        obscuringCharacter: '*',
        decoration: InputDecoration(
          prefixIcon: IconButton(onPressed: (){} ,icon:Icon(prefixIcon,color: Color(0xFFCBC9D9),)),
          helperText: textError??'',
          suffixIcon: IconButton(onPressed: onTape??(){}, icon:Icon(sufixIcon??null,color: Color(0xFFCBC9D9))),
          hintText: text,
          hintStyle: TextStyle(
            color: Color(0xFFCBC9D9),
            fontSize: SizeConfig.scaleTextFont(16),
          ),
          fillColor: Color(0xFFF5F6FA),
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
