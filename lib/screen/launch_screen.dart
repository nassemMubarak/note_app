import 'package:flutter/material.dart';
import 'package:note_app/utiil/size_config.dart';
class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, '/main_on_boarding_screen');
    });
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/launch_screen.png'),
              fit: BoxFit.cover,
              alignment: Alignment.center
            ),
          ),
          child: Center(
            child: Image.asset('images/Logo.png'),
          ),
        ),
    );
  }
}
