class NotesImpNames{
static final String id = "id";
static final String uniqueID = "uniqueID";
static final String pin = "pin";
static final String title = "title";
static final String content = "content";
static final String isArchieve = "isArchieve";
static final String createdTime = "createdTime";
static final String TableName = "Notes";
static final List<String> values = [id ,isArchieve,pin,title,content,createdTime];

}


class Note{
  final int? id;
  final bool pin;
  final bool isArchieve;
  final String title;
  final String uniqueID;
  final String content;
  final DateTime createdTime;

 const Note({
this.id,
required this.pin,
required this.isArchieve,
required this.title,
required this.content,
required this.uniqueID,
required this.createdTime,
  });

Note copy({
  int? id,
  bool? pin,
  bool? isArchieve,
  String? title,
  String? uniqueID,
  String? content,
DateTime? createdTime,
}) {
  return Note(id : id?? this.id ,
   pin:pin ?? this.pin,
   isArchieve:isArchieve ?? this.isArchieve,
   title:  title ?? this.title,
   uniqueID:  uniqueID ?? this.uniqueID,
   content:  content ?? this.content,
   createdTime:  createdTime ?? this.createdTime
   );
}



  static Note fromJson(Map<String ,Object?> json){
    return Note(id: json[NotesImpNames.id] as int? , 
                pin : json[NotesImpNames.pin] ==1,
                isArchieve : json[NotesImpNames.isArchieve] ==1,
                title: json[NotesImpNames.title] as String,
                uniqueID: json[NotesImpNames.uniqueID] as String,
                content: json[NotesImpNames.content] as String,
                createdTime: DateTime.parse(json[NotesImpNames.createdTime] as String)
    );
  }

  Map<String,Object?> toJson() {
    return {
      NotesImpNames.id : id,
      NotesImpNames.pin : pin ? 1 : 0,
      NotesImpNames.isArchieve : isArchieve ? 1 : 0,
      NotesImpNames.title : title,
      NotesImpNames.uniqueID : uniqueID,
    
      NotesImpNames.content : content,
      NotesImpNames.createdTime : createdTime.toIso8601String()
    };
  }
}

  //  id INTEGER PRIMARY KEY AUTOINCREMENT,
  //     pin BOOLEAN NOT NULL,
  //     title TEXT NOT NULL,
  //     content TEXT NOT NULL,
  //     createdTime TEXT NOT NULL