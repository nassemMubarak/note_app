import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:note_app/model/bottom_navigation_model.dart';
import 'package:note_app/screen/bottom_navigation_bar/home_bottom_navigation.dart';
import 'package:note_app/screen/bottom_navigation_bar/profile_bottom_navigation.dart';
import 'package:note_app/screen/bottom_navigation_bar/save_bottom_navigation.dart';
import 'package:note_app/screen/bottom_navigation_bar/search_bottom_navigation.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../utiil/size_config.dart';
import 'appbar_home_screen.dart';

class MainScreenBottomNavigation extends StatefulWidget {
  const MainScreenBottomNavigation({Key? key}) : super(key: key);

  @override
  State<MainScreenBottomNavigation> createState() =>
      _MainScreenBottomNavigationState();
}

class _MainScreenBottomNavigationState
    extends State<MainScreenBottomNavigation> {
  int _selectedIndex = 0;
  static const List<BottomNavigationModel> _bottomNavigationModel = [
    BottomNavigationModel(
        widget: HomeBottomNavigation(), appBarTitleWidget: AppBarHomeScreen()),
    BottomNavigationModel(
        widget: SearchBottomNavigation(),
        appBarTitleWidget: AppBarHomeScreen()),
    BottomNavigationModel(
        widget: SaveBottomNavigation(), appBarTitleWidget: AppBarHomeScreen()),
    BottomNavigationModel(
        widget: ProfileBottomNavigation(),
        appBarTitleWidget: AppBarHomeScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:
            _bottomNavigationModel.elementAt(_selectedIndex).appBarTitleWidget,
        toolbarHeight: SizeConfig.scaleHeight(100),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            ),
            child:SafeArea(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(10), vertical: SizeConfig.scaleHeight(9)),
                child: GNav(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: SizeConfig.scaleTextFont(16),
                  ),
                  rippleColor: Colors.grey[300]!,
                  hoverColor: Colors.grey[100]!,
                  gap: SizeConfig.scaleWidth(8),
                  activeColor: Colors.white,
                  iconSize: SizeConfig.scaleWidth(24),
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(20), vertical: SizeConfig.scaleHeight(10)),
                  duration: Duration(milliseconds: 400),
                  tabBackgroundColor: Color(0xFF7C37FA),
                  color: Color(0xFFCBC9D9),
                  tabs:  [
                    GButton(
                      icon: Icons.eco,
                      text: AppLocalizations.of(context)!.home,
                    ),

                    GButton(
                      icon: LineIcons.search,
                      text: AppLocalizations.of(context)!.search,
                    ),
                    GButton(
                      icon: Icons.bookmark_outlined,
                      text: AppLocalizations.of(context)!.saved,
                    ),
                    GButton(
                      icon: Icons.person,
                      text: AppLocalizations.of(context)!.profile,
                    ),
                  ],
                  selectedIndex: _selectedIndex,
                  onTabChange: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                ),
              ),
            ),
          ),

      body: _bottomNavigationModel.elementAt(_selectedIndex).widget,
    );
  }
}
