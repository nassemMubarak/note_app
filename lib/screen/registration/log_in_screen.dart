import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:note_app/utiil/size_config.dart';
import 'package:note_app/widget/elevated_button_widget.dart';
import 'package:note_app/widget/text_field_widget.dart';
import '../../model/shared_preferences_model.dart';
import '../../utiil/show_snack_bar.dart';
class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  late TextEditingController _emailTextEditingController;
  late TextEditingController _passwordTextEditingController;
  late TapGestureRecognizer _forGetPasswordTapGestureRecognizer;
  late TapGestureRecognizer _signInTapGestureRecognizer;
   String _emailError = '';
   String _passwordError = '';
  IconData iconData = Icons.visibility_off;
  bool obscureText = true;

  @override
  void initState() {
    super.initState();
    _emailTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
    _forGetPasswordTapGestureRecognizer = TapGestureRecognizer()..onTap = forgetPassword;
    _signInTapGestureRecognizer = TapGestureRecognizer()..onTap = signIn;
  }

  @override
  void dispose() {
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    _forGetPasswordTapGestureRecognizer.dispose();
    _signInTapGestureRecognizer.dispose();
    super.dispose();
  }

  void forgetPassword() {
    Navigator.pushNamed(context, '/forgot_password_1');
  }
 void signIn() {
    Navigator.pushNamed(context, '/sin_up_screen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/registration_image/login_image.png'),
              alignment: Alignment.topRight,
            ),
          ),
        child: ListView(
          children: [
            SizedBox(height: SizeConfig.scaleHeight(150)),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(25)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    AppLocalizations.of(context)!.log_in,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: SizeConfig.scaleTextFont(30),
                      color: Color(0xFF0F0A39),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: SizeConfig.scaleHeight(41)),
                  TextFieldWidget(
                      textInputType: TextInputType.emailAddress,
                      textError: _emailError,
                      textEditingController: _emailTextEditingController,
                      text: AppLocalizations.of(context)!.email),
                  SizedBox(height: SizeConfig.scaleHeight(20)),
                  TextFieldWidget(
                    textError: _passwordError,
                    textEditingController: _passwordTextEditingController,
                    text: AppLocalizations.of(context)!.enter_password,
                    sufixIcon: iconData,
                    obscureText: obscureText,
                    onTape: () {
                      setState(() {
                        iconData = iconData == Icons.visibility_off
                            ? Icons.visibility
                            : Icons.visibility_off;
                        obscureText =
                            iconData == Icons.visibility_off ? true : false;
                      });
                    },
                  ),
                  SizedBox(height: SizeConfig.scaleHeight(5)),
                  RichText(
                    textAlign: TextAlign.end,
                    text: TextSpan(
                      recognizer: _forGetPasswordTapGestureRecognizer,
                      text: AppLocalizations.of(context)!.forgot_password,
                      style: TextStyle(
                        color: Color(0xFF7B7890),
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.scaleHeight(40)),
                  ElevatedButtonWidget(
                    text: AppLocalizations.of(context)!.log_in,
                    color: const Color(0xFF7C37FA),
                    textColor: Colors.white,
                    onTape: () {
                      logIn();
                    },
                  ),
                  SizedBox(height: SizeConfig.scaleHeight(20)),
                  Text(
                    '————— ${AppLocalizations.of(context)!.or} —————',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: SizeConfig.scaleHeight(20)),
                  Row(
                    children: [
                      ElevatedButtonWidget(
                          text: AppLocalizations.of(context)!.facebook,
                          image: 'images/registration_image/facebook.png',
                          onTape: () {},
                          color: Color(0xFF3C5A99),
                          textColor: Colors.white,
                          width: SizeConfig.scaleWidth(149)),
                      SizedBox(width: SizeConfig.scaleWidth(20)),
                      ElevatedButtonWidget(
                          text: AppLocalizations.of(context)!.google,
                          image: 'images/registration_image/google.png',
                          onTape: () {},
                          color: Color(0xFFF95341),
                          textColor: Colors.white,
                          width: SizeConfig.scaleWidth(149)),
                    ],
                  ),
                  SizedBox(height: SizeConfig.scaleHeight(20)),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: AppLocalizations.of(context)!.don_not_have_account,
                      style: TextStyle(
                        color: Color(0xFF7B7890),
                      ),
                      children: [
                        TextSpan(
                          recognizer: _signInTapGestureRecognizer,
                          text: AppLocalizations.of(context)!.sin_up,
                          style: TextStyle(
                            color: Color(0xFF7C37FA),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  logIn(){
    if(checkData()){
      SharedPreferencesModel().changeLogInApp(true);
      Navigator.pushReplacementNamed(context, '/main_screen_bottom_navigation');
    }
  }
  bool checkData(){
    if(_passwordTextEditingController.text.isNotEmpty&&_emailTextEditingController.text.isNotEmpty){
      return true;
    }
    selectEmptyInputData();
    return false;
  }
  void selectEmptyInputData(){
    if(_passwordTextEditingController.text.isEmpty&&_emailTextEditingController.text.isEmpty){
      ShowSnackBar.showSnackBar(context, text: AppLocalizations.of(context)!.empty_input);
      setState((){
        _emailError = AppLocalizations.of(context)!.email_empty;
        _passwordError = AppLocalizations.of(context)!.password_empty;
      });
    }else if(_emailTextEditingController.text.isEmpty){
      ShowSnackBar.showSnackBar(context, text: AppLocalizations.of(context)!.email_empty);
      setState((){
        _emailError = AppLocalizations.of(context)!.email_empty;
        _passwordError = '';
      });
    }else{
      ShowSnackBar.showSnackBar(context, text: AppLocalizations.of(context)!.password_empty);
      setState((){
        _emailError = '';
        _passwordError = AppLocalizations.of(context)!.password_empty;
      });
    }
  }

}

