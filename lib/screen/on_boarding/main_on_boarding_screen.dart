import 'package:flutter/material.dart';
import 'package:note_app/change_notifier/controller_provider_language.dart';
import 'package:note_app/widget/on_boarding_widget/indicator_on_boarding.dart';
import 'package:provider/provider.dart';

import '../../utiil/size_config.dart';
import '../../widget/on_boarding_widget/contain_on_boarding.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../widget/on_boarding_widget/show_dialog_widget_language.dart';

class MainOnBoardingScreen extends StatefulWidget {
  const MainOnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<MainOnBoardingScreen> createState() => _MainOnBoardingScreenState();
}

class _MainOnBoardingScreenState extends State<MainOnBoardingScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    Future.delayed(Duration.zero, () async {
      bool languge = await showDialogWidget(context);
      Provider.of<ControllerProviderLanguage>(context, listen: false)
          .changLanguage(languge != true ? 'ar' : 'en');
    });
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: AlignmentDirectional.topStart,
        margin: EdgeInsetsDirectional.only(
            start: SizeConfig.scaleWidth(28),
            end: SizeConfig.scaleWidth(28),
            bottom: SizeConfig.scaleHeight(20),
            top: SizeConfig.scaleHeight(58)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IndicatorOnBoarding(
                          selected: _currentPage == 0, margenEnd: 7),
                      IndicatorOnBoarding(
                          selected: _currentPage == 1, margenEnd: 7),
                      IndicatorOnBoarding(selected: _currentPage == 2),
                    ],
                  ),
                  Visibility(
                    visible: _currentPage != 2,
                    child: TextButton(
                      onPressed: () {
                        _pageController.nextPage(duration: Duration(seconds: 2),
                            curve: Curves.easeOutCirc);
                      },
                      child: Text(
                        AppLocalizations.of(context)!.skip,
                        style:
                        TextStyle(fontSize: SizeConfig.scaleTextFont(14)),
                      ),),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: SizeConfig.scaleHeight(70),
              bottom: SizeConfig.scaleHeight(10),
              child: PageView(
                controller: _pageController,
                onPageChanged: (int selected) {
                  setState(() {
                    _currentPage = selected;
                  });
                },
                children: [
                  ContainOnBoarding(
                      image: 'images/on_boarding_images/on_boarding_1.png',
                      subTitle:
                      AppLocalizations.of(context)!.on_boarding_contain_1),
                  ContainOnBoarding(
                      image: 'images/on_boarding_images/on_boarding_2.png',
                      subTitle:
                      AppLocalizations.of(context)!.on_boarding_contain_2),
                  ContainOnBoarding(
                      visible: _currentPage == 2,
                      image: 'images/on_boarding_images/on_boarding_3.png',
                      subTitle:
                      AppLocalizations.of(context)!.on_boarding_contain_3)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}