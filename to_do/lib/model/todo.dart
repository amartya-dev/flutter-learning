class ToDo {
  int id;
  String description;
  bool isDone = false;

  ToDo({this.id, this.description, this.isDone});

  factory ToDo.fromDatabaseJson(
    Map <String, dynamic> data
  ) => ToDo(
    id: data['id'],
    description: data['description'],
    isDone: data['is_done'] == 0 ? false : true,
  );

  Map <String, dynamic> toDatabaseJson() => {
    "id": this.id,
    "description": this.description,
    "is_done": this.isDone == false ? 0 : 1
  };
}
