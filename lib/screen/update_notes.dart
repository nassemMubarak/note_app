import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../change_notifier/notes_change_notifier.dart';
import '../model/notes.dart';
import '../utiil/size_config.dart';
class UpdateNotes extends StatefulWidget {
  final Notes notes;


  UpdateNotes(this.notes);

  @override
  State<UpdateNotes> createState() => _UpdateNotesState();
}

class _UpdateNotesState extends State<UpdateNotes> {
  late TextEditingController _titleTextEditingController;
  late TextEditingController _subTitleTextEditingController;
  @override
  void initState() {
    super.initState();
    _titleTextEditingController = TextEditingController(text:widget.notes.title);
    _subTitleTextEditingController = TextEditingController(text:widget.notes.image);
  }
  @override
  void dispose() {
    _titleTextEditingController.dispose();
    _subTitleTextEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
          elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(28),
            vertical: SizeConfig.scaleHeight(12)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsetsDirectional.only(
                        start: SizeConfig.scaleWidth(5)),
                    width: SizeConfig.scaleWidth(150),
                    height: SizeConfig.scaleHeight(40),
                    decoration: BoxDecoration(
                        color: Color(0x107C37FA),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                            'images/on_boarding_writing_image/book-bookmark.png'),
                        Spacer(),
                        Text(AppLocalizations.of(context)!.all_note,
                          style: TextStyle(
                              color: Color(0xFF7C37FA),
                              fontSize: SizeConfig.scaleTextFont(14)
                          ),),
                        IconButton(onPressed: () {},
                            icon: Icon(Icons.keyboard_arrow_down_sharp,
                              color: Color(0xFF7C37FA),)),
                      ],
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () async {
                      updateData();

                      Navigator.pop(context);
                    },
                    child: Text(AppLocalizations.of(context)!.done,
                      style: TextStyle(
                          color: const Color(0xFF7C37FA),
                          fontSize: SizeConfig.scaleTextFont(16)),),
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.scaleHeight(25)),
              const Divider(thickness: 1),
              SizedBox(height: SizeConfig.scaleHeight(16)),
               Text(AppLocalizations.of(context)!.title),
              SizedBox(height: SizeConfig.scaleHeight(5)),
              TextField(
                controller: _titleTextEditingController,
                maxLines: 2,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.title,
                  hintStyle: TextStyle(
                    color: Color(0xFFCBC9D9),
                    fontSize: SizeConfig.scaleTextFont(16),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.scaleHeight(16)),
               Text(AppLocalizations.of(context)!.sub_title),
              SizedBox(height: SizeConfig.scaleHeight(5)),
              TextField(
                controller: _subTitleTextEditingController,
                maxLines: 20,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.start_writing,
                  hintStyle: TextStyle(
                    color: Color(0xFFCBC9D9),
                    fontSize: SizeConfig.scaleTextFont(16),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
Future updateData()async{
  bool s =await  Provider.of<NotesChangeNotifier>(context,listen: false).update(notes);
}
Notes get notes{
  Notes notes = widget.notes;
  notes.title =_titleTextEditingController.text;
  notes.image = _subTitleTextEditingController.text;
  notes.dateTime = 'May/5';
  return notes;
}
}
