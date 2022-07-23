import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:note_app/change_notifier/controller_provider_language.dart';
import 'package:note_app/utiil/size_config.dart';
import 'package:note_app/widget/elevated_button_widget.dart';
import 'package:note_app/widget/text_field_widget.dart';
import 'package:provider/provider.dart';

class ForgotPassword1 extends StatefulWidget {
  const ForgotPassword1({Key? key}) : super(key: key);

  @override
  State<ForgotPassword1> createState() => _ForgotPassword1State();
}

class _ForgotPassword1State extends State<ForgotPassword1> {
  bool colorButton = false;
  late TextEditingController _textEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          AppLocalizations.of(context)!.forgot_password,
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
                    EdgeInsetsDirectional.only(end: SizeConfig.scaleWidth(150)),
                child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                        style: TextStyle(color: Color(0xFF7B7890)),
                        text: AppLocalizations.of(context)!
                            .forgot_password_contain_text1,
                        children: [
                          TextSpan(
                            style: TextStyle(color: Color(0xFF7C37FA)),
                            text: AppLocalizations.of(context)!
                                .forgot_password_contain_text2,
                          ),
                          TextSpan(
                              text: AppLocalizations.of(context)!
                                  .forgot_password_contain_text3),
                        ])),
              ),
              SizedBox(height: SizeConfig.scaleHeight(70)),
              TextFieldWidget(
                textInputType: TextInputType.emailAddress,
                textEditingController: _textEditingController,
                text: AppLocalizations.of(context)!.email,
                onChange: (String text) {
                  chickEmail(text);
                },
              ),
              SizedBox(height: SizeConfig.scaleHeight(150)),
              ElevatedButtonWidget(
                  text: AppLocalizations.of(context)!.send,
                  onTape: () {
                    if (colorButton) {
                      Navigator.pushNamed(context, '/verify_code',
                          arguments: {'email': _textEditingController.text});
                    }
                  },
                  color: colorButton == false
                      ? Color(0xFFF2F2F3)
                      : Color(0xFF7C37FA),
                  textColor: colorButton == false
                      ? Color(0xFFCBC9D9)
                      : Color(0xFFFFFFFF)),
            ],
          ),
        ),
      ),
    );
  }

  void chickEmail(String text) {
    setState(() {
      if (text.length > 9) {
        colorButton = true;
      } else {
        colorButton = false;
      }
    });
  }
}
