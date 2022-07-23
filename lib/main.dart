import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:note_app/change_notifier/notes_change_notifier.dart';
import 'package:note_app/screen/bottom_navigation_bar/main_screen_bottom_navigation.dart';
import 'package:note_app/screen/launch_screen.dart';
import 'package:note_app/screen/on_boarding/main_on_boarding_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:note_app/screen/registration/log_in_screen.dart';
import 'package:note_app/screen/registration/password_forget/verify_code.dart';
import 'package:note_app/screen/registration/password_forget/forgot_password_1.dart';
import 'package:note_app/screen/registration/sin_up_screen.dart';
import 'package:note_app/change_notifier/controller_provider_language.dart';
import 'package:note_app/screen/update_notes.dart';
import 'package:note_app/screen/writing_notes/writing_onboarding/home_writing_screen.dart';
import 'package:note_app/storage/db/controller/notes_db_controller.dart';
import 'package:note_app/storage/db/db_provider.dart';
import 'package:provider/provider.dart';

import 'model/shared_preferences_model.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DBProvider().initDataBase();
 await SharedPreferencesModel().initialSharedPrefrences();
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>ControllerProviderLanguage()),
        ChangeNotifierProvider(create: (context)=>NotesChangeNotifier()),
      ],
      builder: (BuildContext context, Widget? child){
        return MaterialApp(
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark,
                statusBarBrightness: Brightness.light,
              )
            ),
              textTheme: const TextTheme(
                  bodyText2: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    color: Color(0xFF7B7890),
                  ),
                button:  TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                ),
              ),
          ),

          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate
          ],
          supportedLocales: const [
            Locale('ar',''),
            Locale('en','')
          ],
          locale: Locale(Provider.of<ControllerProviderLanguage>(context).language),
          initialRoute:SharedPreferencesModel().getLogInApp?'/main_screen_bottom_navigation':'/launch_screen',
          routes: {
            '/launch_screen':(context)=>const LaunchScreen(),
            '/main_on_boarding_screen':(context)=>const MainOnBoardingScreen(),
            '/log_in_screen':(context)=>const LogInScreen(),
            '/sin_up_screen':(context)=>const SinUpScreen(),
            '/forgot_password_1':(context)=>const ForgotPassword1(),
            '/verify_code':(context)=>const VerifyCode(),
            '/main_screen_bottom_navigation':(context)=>const MainScreenBottomNavigation(),
            '/home_writing_screen':(context)=>const HomeWritingScreen(),
          },
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
