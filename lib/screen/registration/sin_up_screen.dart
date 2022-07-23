import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:note_app/utiil/size_config.dart';
import 'package:note_app/widget/elevated_button_widget.dart';
import 'package:note_app/widget/text_field_widget.dart';
import '../../utiil/show_snack_bar.dart';
class SinUpScreen extends StatefulWidget {
  const SinUpScreen({Key? key}) : super(key: key);

  @override
  State<SinUpScreen> createState() => _SinUpScreenState();
}

class _SinUpScreenState extends State<SinUpScreen> {
  late TextEditingController _emailTextEditingController;
  late TextEditingController _passwordTextEditingController;
  late TextEditingController _confirmPasswordTextEditingController;
  late TapGestureRecognizer _tapGestureRecognizer;
  String _emailError = '';
  String _passwordError = '';
  String _confirmPasswordError = '';
  IconData iconData = Icons.visibility_off;
  bool obscureText1 = true;
  bool obscureText2 = true;

  @override
  void initState() {
    super.initState();
    _emailTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
    _confirmPasswordTextEditingController = TextEditingController();
    _tapGestureRecognizer = TapGestureRecognizer()..onTap = forgetPassword;
  }
  @override
  void dispose() {
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    _confirmPasswordTextEditingController.dispose();
    _tapGestureRecognizer.dispose();
    super.dispose();
  }
  void forgetPassword() {
    Navigator.pushReplacementNamed(context, '/log_in_screen');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        alignment: AlignmentDirectional.topStart,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/registration_image/login_image.png'),
            alignment: Alignment.topRight,
          ),
        ),
        child: ListView(
          children: [
            Padding(
              padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(25)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: SizeConfig.scaleHeight(210)),
                  Text(
                    AppLocalizations.of(context)!.sin_up,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: SizeConfig.scaleTextFont(30),
                      color: Color(0xFF0F0A39),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: SizeConfig.scaleHeight(31)),
                  Column(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     TextFieldWidget(
                         textInputType: TextInputType.emailAddress,
                         textError: _emailError,
                         textEditingController: _emailTextEditingController,
                         text: AppLocalizations.of(context)!.email),
                     TextFieldWidget(
                       textError: _passwordError,
                       textEditingController: _passwordTextEditingController,
                       text: AppLocalizations.of(context)!.enter_password,
                       sufixIcon: iconData,
                       obscureText: obscureText1,
                       onTape: () {
                         setState(() {
                           iconData = iconData == Icons.visibility_off
                               ? Icons.visibility
                               : Icons.visibility_off;
                           obscureText1 =
                           iconData == Icons.visibility_off ? true : false;
                         });
                       },
                     ),
                     TextFieldWidget(
                       textError: _confirmPasswordError,
                       textEditingController: _confirmPasswordTextEditingController,
                       text: AppLocalizations.of(context)!.enter_password,
                       sufixIcon: iconData,
                       obscureText: obscureText2,
                       onTape: () {
                         setState(() {
                           iconData = iconData == Icons.visibility_off
                               ? Icons.visibility
                               : Icons.visibility_off;
                           obscureText2 =
                           iconData == Icons.visibility_off ? true : false;
                         });
                       },
                     ),
                   ],
                 ),
                  SizedBox(height: SizeConfig.scaleHeight(25)),
                  ElevatedButtonWidget(
                    text: AppLocalizations.of(context)!.sin_up,
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
                      text: AppLocalizations.of(context)!.already_have_account,
                      style: const TextStyle(
                        color: Color(0xFF7B7890),
                      ),
                      children: [
                        TextSpan(
                          recognizer: _tapGestureRecognizer,
                          text: AppLocalizations.of(context)!.log_in,
                          style: const TextStyle(
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
      ShowSnackBar.showSnackBar(context, text: AppLocalizations.of(context)!.empty_input,selected: true);
      Navigator.pushReplacementNamed(context, '/log_in_screen');
    }
  }
  bool checkData(){
    if(_passwordTextEditingController.text.isNotEmpty&&_emailTextEditingController.text.isNotEmpty){
      if(!chickPasswordEqual()){
        return false;
      }
      return true;
    }
    selectEmptyInputData();
    return false;
  }
  void selectEmptyInputData(){
    if(_passwordTextEditingController.text.isEmpty&&_emailTextEditingController.text.isEmpty&&_confirmPasswordTextEditingController.text.isEmpty){
      ShowSnackBar.showSnackBar(context, text: AppLocalizations.of(context)!.empty_input);
      setState((){
        _emailError = AppLocalizations.of(context)!.email_empty;
        _passwordError = AppLocalizations.of(context)!.password_empty;
        _confirmPasswordError ='';
      });
    }else if(_emailTextEditingController.text.isEmpty){
      ShowSnackBar.showSnackBar(context, text: AppLocalizations.of(context)!.email_empty);
      setState((){
        _emailError = AppLocalizations.of(context)!.email_empty;
        _passwordError = '';
        _confirmPasswordError ='';
      });
    }else if(_passwordTextEditingController.text.isEmpty){
      ShowSnackBar.showSnackBar(context, text: AppLocalizations.of(context)!.password_empty);
      setState((){
        _emailError = '';
        _confirmPasswordError ='';
        _passwordError = AppLocalizations.of(context)!.password_empty;
      });
    }else if(_confirmPasswordTextEditingController.text.isEmpty){
      ShowSnackBar.showSnackBar(context, text: AppLocalizations.of(context)!.confirm_password_empty);
      setState((){
        _emailError = '';
        _passwordError = '';
        _confirmPasswordError = AppLocalizations.of(context)!.confirm_password_empty;
      });
    }
  }
  bool chickPasswordEqual(){
    if(_confirmPasswordTextEditingController.text==_passwordTextEditingController.text){
      return true;
    }
    ShowSnackBar.showSnackBar(context, text: AppLocalizations.of(context)!.confirm_password_error);
   setState((){
     print('111111111111111');
     _confirmPasswordError = AppLocalizations.of(context)!.confirm_password_error;
     _passwordError = '';
     _emailError ='';
   });
    return false;
  }
}

