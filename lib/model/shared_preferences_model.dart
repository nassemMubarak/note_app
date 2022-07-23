import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesModel{
 late SharedPreferences _sharedPreferences;
  final String _keyLogIn = 'logIn';
    SharedPreferencesModel._internal();
    static final SharedPreferencesModel _instance = SharedPreferencesModel._internal();
    factory SharedPreferencesModel(){
        return _instance;
    }
    Future<void> initialSharedPrefrences()async{
        _sharedPreferences =await SharedPreferences.getInstance();
    }
    Future<bool> changeLogInApp(bool login)async{
      return await _sharedPreferences.setBool(_keyLogIn,login);
    }
    bool get getLogInApp => _sharedPreferences.getBool(_keyLogIn)??false;
}