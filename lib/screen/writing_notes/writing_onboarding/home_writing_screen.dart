import 'package:flutter/material.dart';
import 'package:note_app/change_notifier/notes_change_notifier.dart';
import 'package:note_app/model/bottom_navigation_model.dart';
import 'package:note_app/screen/writing_notes/writing_onboarding/camera_onboarding.dart';
import 'package:note_app/screen/writing_notes/writing_onboarding/draw_onboarding.dart';
import 'package:note_app/screen/writing_notes/writing_onboarding/writing_onbordeing.dart';
import 'package:note_app/utiil/size_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'file_onboarding.dart';

class HomeWritingScreen extends StatefulWidget {
  const HomeWritingScreen({Key? key}) : super(key: key);
  @override
  State<HomeWritingScreen> createState() => _HomeWritingScreenState();
}
class _HomeWritingScreenState extends State<HomeWritingScreen> {
   int _currentIndex = 0;
   static const List<BottomNavigationModel> _bottomNavigationModel= [
        BottomNavigationModel(widget: WritingOnBoarding()),
        BottomNavigationModel(widget: CameraOnBoarding()),
        BottomNavigationModel(widget: DrawOnBoarding()),
        BottomNavigationModel(widget: WritingOnBoarding()),
        BottomNavigationModel(widget: FileOnBoarding()),
   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:_currentIndex!=2? AppBar(
        actionsIconTheme: IconThemeData(
          color: Color(0xFF0F0A39),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: const Color(0xFF0F0A39),
          size: SizeConfig.scaleWidth(25),),

        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.error)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),

        ],
      ):null,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        currentIndex: _currentIndex,
        onTap: (int index){
          setState((){
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Image.asset('images/on_boarding_writing_image/Icon - Leaf.png'),label: ''),
          BottomNavigationBarItem(icon: Image.asset('images/on_boarding_writing_image/Icon - Camera.png'),label: ''),
          BottomNavigationBarItem(icon: Image.asset('images/on_boarding_writing_image/Icon - Brush.png'),label: ''),
          BottomNavigationBarItem(icon: Image.asset('images/on_boarding_writing_image/trash-can.png'),label: ''),
          BottomNavigationBarItem(icon: Image.asset('images/on_boarding_writing_image/trash-can copy.png'),label: ''),
        ],
      ),
      body: _bottomNavigationModel.elementAt(_currentIndex).widget,
    );
  }
}
