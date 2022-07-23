import 'dart:developer';
import 'dart:math';

import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:note_app/change_notifier/controller_provider_language.dart';
import 'package:note_app/utiil/show_snack_bar.dart';
import 'package:note_app/widget/text_field_widget.dart';
import 'package:provider/provider.dart';

import '../../../utiil/size_config.dart';
import '../../../widget/elevated_button_widget.dart';
class VerifyCode extends StatefulWidget {
  const VerifyCode({Key? key}) : super(key: key);

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  late FocusNode firstFocusNode;
  late FocusNode furthFocusNode;
  late FocusNode secondFocusNode;
  late FocusNode thirdFocusNode;
  late TextEditingController _firstCodeTextController;
  late TextEditingController _secondCodeTextController;
  late TextEditingController _thirdCodeTextController;
  late TextEditingController _fourthCodeTextController;
  String counter = '00';
  @override
  void initState() {
    super.initState();
    _firstCodeTextController = TextEditingController();
    _secondCodeTextController = TextEditingController();
    _thirdCodeTextController = TextEditingController();
    _fourthCodeTextController = TextEditingController();
    firstFocusNode = FocusNode();
    furthFocusNode = FocusNode();
    secondFocusNode = FocusNode();
    thirdFocusNode = FocusNode();

  }
  @override
  void dispose() {
    _firstCodeTextController.dispose();
    _secondCodeTextController.dispose();
    _thirdCodeTextController.dispose();
    _fourthCodeTextController.dispose();
    firstFocusNode.dispose();
    furthFocusNode.dispose();
    secondFocusNode.dispose();
    thirdFocusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Map<String,dynamic> data = ModalRoute.of(context)?.settings.arguments as Map<String,dynamic>;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_outlined),
          color: Color(0xFF0F0A39),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          AppLocalizations.of(context)!.verify_code,
          style: TextStyle(
            fontSize: SizeConfig.scaleTextFont(20),
            color: Color(0xFF0F0A39),
          ),
        ),
      ),
      body: Container(

        margin: EdgeInsets.all(SizeConfig.scaleWidth(22)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                EdgeInsetsDirectional.only(end: SizeConfig.scaleWidth(100)),
                child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                        style: TextStyle(color: Color(0xFF7B7890)),
                        text: AppLocalizations.of(context)!
                            .verify_code_title,
                        children: [
                          TextSpan(
                            style: TextStyle(color: Color(0xFF7C37FA)),
                            text: data['email'],
                          ),
                        ])),
              ),
              SizedBox(height: SizeConfig.scaleHeight(43)),
              SizedBox(
                height: SizeConfig.scaleHeight(100),
                child: Row(
                  children: [
                    Expanded(child: TextField(
                      focusNode: firstFocusNode,
                      keyboardType: TextInputType.number,
                      controller: _firstCodeTextController,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      onChanged: (String text){
                        if(text.isNotEmpty){
                          secondFocusNode.requestFocus();
                        }
                      },
                      decoration: InputDecoration(
                        counterText: '',
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
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    )),
                    SizedBox(width: SizeConfig.scaleWidth(20)),
                    Expanded(child: TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      onChanged: (String text){
                        if(text.isNotEmpty){
                          thirdFocusNode.requestFocus();
                        }else{
                          firstFocusNode.requestFocus();
                        }
                      },
                      focusNode: secondFocusNode,
                      controller: _secondCodeTextController,
                      maxLength: 1,
                      decoration: InputDecoration(
                        counterText: '',
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
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    )),
                    SizedBox(width: SizeConfig.scaleWidth(20)),
                    Expanded(child: TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      onChanged: (String text){
                        if(text.isNotEmpty){
                          furthFocusNode.requestFocus();
                        }else{
                          secondFocusNode.requestFocus();
                        }
                      },
                      focusNode: thirdFocusNode,
                      controller: _thirdCodeTextController,
                      maxLength: 1,
                      decoration: InputDecoration(
                        counterText: '',
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
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    )),
                    SizedBox(width: SizeConfig.scaleWidth(20)),
                    Expanded(child: TextField(
                      onChanged: (String text){
                        if(text.isEmpty){
                          thirdFocusNode.requestFocus();
                        }
                      },
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      focusNode: furthFocusNode,
                      controller: _fourthCodeTextController,
                      maxLength: 1,
                      decoration: InputDecoration(
                        counterText: '',
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
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    )),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.scaleHeight(16)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.of(context)!.did_not_receive_the_code),
                  TextButton(onPressed: (){}, child: Text(AppLocalizations.of(context)!.resend,style: TextStyle(color: Color(0xFF7C37FA)),))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Countup(
                    prefix: '( 00:',
                    begin: 59,
                    end: 0,
                    textAlign: TextAlign.end,
                    duration: Duration(seconds: 60),
                    suffix: ' )',
                    locale: Locale(Provider.of<ControllerProviderLanguage>(context).language),
                    style: TextStyle(
                    fontSize: SizeConfig.scaleTextFont(18),
                      color: Color(0xFF7B7890),
                    ),
                   ),
                ],
              ),
              SizedBox(height: SizeConfig.scaleHeight(100)),
              ElevatedButtonWidget(
                  text: AppLocalizations.of(context)!.send,
                  color:Color(0xFF7C37FA),
                  textColor: Color(0xFFFFFFFF),
              onTape: (){
                sendVerifyCode();
              },
              ),
            ],
          ),
        ),
      ),
    );
  }
  sendVerifyCode(){
    if(chickData()){
      Navigator.pushReplacementNamed(context, '/log_in_screen');
    }
  }
  bool chickData(){
    if(_firstCodeTextController.text.isNotEmpty&&_secondCodeTextController.text.isNotEmpty&&_thirdCodeTextController.text.isNotEmpty&&_fourthCodeTextController.text.isNotEmpty){
      return true;
    }
    ShowSnackBar.showSnackBar(context, text: AppLocalizations.of(context)!.empty_input);
    return false;
  }

}
