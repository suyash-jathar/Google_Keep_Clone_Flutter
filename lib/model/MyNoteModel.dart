// For Performing Methods
class NotesImpName{
  static final id="id";
  static final pin="pin";
  static final title="title";
  static final content="content";
  static final createdTime="createdTime";
  static final String TableName="Notes";
  

  static final List<String> values=[id,pin,title,content,createdTime];

}


class Note{
  final int? id;
  final bool pin;
  final String title;
  final String content;
  final DateTime createdTime;

  const Note({
    this.id,
    required this.pin,
    required this.title,
    required this.content,
    required this.createdTime
    });
  
  Note copy({
    int? id,
    bool? pin,
    String? title,
    String? content,
    DateTime? createdTime
  }){
    return Note(
      id: id?? this.id,
      pin: pin?? this.pin,
      title: title?? this.title,
      content: content?? this.content,
      createdTime: createdTime?? this.createdTime
      );
  }
    
  
  // Converting Data from JSON to Map
  static Note fromJSON(Map<String,Object?> json){
    return Note(
      id: json[NotesImpName.id] as int?,
      pin: json[NotesImpName.pin]==1, 
      title: json[NotesImpName.title] as String, 
      content: json[NotesImpName.content] as String, 
      createdTime: DateTime.parse(json[NotesImpName.createdTime] as String)
      );
  }

  // Map -> JSON
  Map<String,Object?> toJson(){
    return {
      NotesImpName.id: id,
      NotesImpName.pin:pin ? 1 : 0,
      NotesImpName.title:title, 
      NotesImpName.content:content,
      NotesImpName.createdTime:createdTime.toIso8601String()
    };
  }

}