class Notes{
  late int id;
  late  String title;
  late String image;
  late String dateTime;
  Notes();
  static const String tableName = 'notes';
  Notes.fromMap(Map<String,dynamic> rowMap){
   id = rowMap['id'];
   title = rowMap['title'];
   image = rowMap['image'];
   dateTime = rowMap['dateTime'];
  }
  Map<String,dynamic> toMap(){
    Map<String,dynamic> rowMap = <String,dynamic>{};
    rowMap['title'] = title;
    rowMap['image'] = image;
    rowMap['dateTime'] = dateTime;
    return rowMap;

  }
}
