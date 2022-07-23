import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:note_app/change_notifier/notes_change_notifier.dart';
import 'package:note_app/screen/update_notes.dart';
import 'package:provider/provider.dart';
import '../../model/notes.dart';
import '../../utiil/size_config.dart';

class HomeBottomNavigation extends StatefulWidget {
  const HomeBottomNavigation({Key? key}) : super(key: key);

  @override
  State<HomeBottomNavigation> createState() => _HomeBottomNavigationState();
}

class _HomeBottomNavigationState extends State<HomeBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.scaleWidth(28),
          vertical: SizeConfig.scaleHeight(10)),
      children: [
        SizedBox(
          height: SizeConfig.scaleHeight(225),
          child: Row(
            children: [
              GestureDetector(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('images/home_screen_image/all_note_imag.png'),
                    const Spacer(),
                    RichText(
                        text: TextSpan(
                            text: AppLocalizations.of(context)!.all_note,
                            style: TextStyle(
                                color: const Color(0xFF0F0A39),
                                fontSize: SizeConfig.scaleTextFont(16)),
                            children: [
                          TextSpan(
                            text: '(18)',
                            style: TextStyle(
                                color: const Color(0xFF7C37FA),
                                fontSize: SizeConfig.scaleTextFont(16)),
                          ),
                        ])),
                  ],
                ),
                onTap: () {},
              ),
              const Spacer(),
              GestureDetector(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('images/home_screen_image/notebook_image.png'),
                    const Spacer(),
                    RichText(
                        text: TextSpan(
                            text: AppLocalizations.of(context)!.notebook,
                            style: TextStyle(
                                color: Color(0xFF0F0A39),
                                fontSize: SizeConfig.scaleTextFont(16)),
                            children: [
                          TextSpan(
                              text: '(4)',
                              style: TextStyle(
                                  color: Color(0xFF7C37FA),
                                  fontSize: SizeConfig.scaleTextFont(16))),
                        ])),
                  ],
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
        SizedBox(height: SizeConfig.scaleHeight(23)),
        SizedBox(
          height: SizeConfig.scaleHeight(290),
          width: SizeConfig.scaleWidth(375),
          child: Consumer<NotesChangeNotifier>(
            builder: (
              BuildContext context,
              NotesChangeNotifier value,
              Widget? child,
            ) {
              if (value.notes.isEmpty) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.warning,
                      size: 90,
                      color: Colors.grey.shade300,
                    ),
                    Text(
                      AppLocalizations.of(context)!.no_notes,
                      style:
                          TextStyle(color: Colors.grey.shade400, fontSize: 28),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              }
              return ListView.separated(
                itemCount: value.notes.length,
                itemBuilder: (context, index) {
                  Notes notes = value.notes.elementAt(index);
                  return ListTile(
                    onLongPress: () {
                      showDialog(
                        barrierDismissible: false,
                        barrierColor: Colors.teal.withOpacity(0.5),
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            title: Text(AppLocalizations.of(context)!
                                .title_alert_dialog),
                            titleTextStyle: TextStyle(
                                fontSize: SizeConfig.scaleTextFont(20),
                                color: Colors.teal),
                            actions: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        shape: const RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadiusDirectional.only(
                                                  bottomStart:
                                                      Radius.circular(10)),
                                        ),
                                        primary: Colors.green.withOpacity(0.8)),
                                    child: Text(
                                        AppLocalizations.of(context)!.cancel,
                                        style: const TextStyle(
                                            color: Colors.white)),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      deletContact(notes.id, index);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.red.withOpacity(0.8),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusDirectional.only(
                                                topEnd: Radius.circular(10)),
                                      ),
                                    ),
                                    child: Text(
                                      AppLocalizations.of(context)!.delete,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      );
                    },
                    leading: Container(
                      width: SizeConfig.scaleWidth(8),
                      decoration:  BoxDecoration(
                        color:index%2==0?const Color(0xFF7C37FA):const Color(0xFFFFCC0A),
                        borderRadius: const BorderRadiusDirectional.only(
                            topEnd: Radius.circular(5),
                            bottomEnd: Radius.circular(5)),
                      ),
                    ),
                    title: Text(notes.title),
                    subtitle: Text(notes.dateTime),
                    trailing: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UpdateNotes(notes)));
                        },
                        icon: const Icon(Icons.arrow_forward_ios_rounded)),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 1,
                    color: Color(0xFFEAE9F0),
                    thickness: 1,
                  );
                },
              );
            },
          ),
        ),
        Container(
          alignment: AlignmentDirectional.centerEnd,
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Container(
                        color: Colors.black.withOpacity(0.5),
                        alignment: Alignment.center,
                        height: 50,
                        width: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              child: Container(
                                height: SizeConfig.scaleHeight(152),
                                width: SizeConfig.scaleWidth(319),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                        'images/home_screen_image/writing.jpg'),
                                    SizedBox(
                                        height: SizeConfig.scaleHeight(13)),
                                    Text(
                                      AppLocalizations.of(context)!
                                          .start_writing,
                                      style: TextStyle(
                                        fontSize: SizeConfig.scaleTextFont(18),
                                        color: Color(0xFF7B7890),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.pushNamed(
                                    context, '/home_writing_screen');
                              },
                            ),
                            SizedBox(height: SizeConfig.scaleHeight(20)),
                            GestureDetector(
                              child: Container(
                                height: SizeConfig.scaleHeight(152),
                                width: SizeConfig.scaleWidth(319),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                        'images/home_screen_image/template.jpg'),
                                    SizedBox(
                                        height: SizeConfig.scaleHeight(13)),
                                    Text(
                                      AppLocalizations.of(context)!
                                          .choose_a_template,
                                      style: TextStyle(
                                        fontSize: SizeConfig.scaleTextFont(18),
                                        color: Color(0xFF7B7890),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.pushNamed(
                                    context, '/home_writing_screen');
                              },
                            ),
                          ],
                        ),
                      );
                    });
              });
            },
            child: Icon(Icons.add),
          ),
        ),
      ],
    );
  }

  Future deletContact(int id, int index) async {
    await Provider.of<NotesChangeNotifier>(context, listen: false)
        .delete(id, index);
  }
}
