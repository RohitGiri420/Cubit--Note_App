class NoteModel{
  int? Id;
  String title;
  String description;

  NoteModel({required this.title,required this.description});

  Future<NoteModel> fromMap(Map<String,dynamic>map){
    return NoteModel(title: title, description: description);
  }
}