class Contacts {
  int userId;
  int id;
  String title;
  String body;

  Contacts({this.userId, this.id, this.title, this.body});

  factory Contacts.fromJson(Map<String, dynamic> json) {  //parse 1 object
    return Contacts(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}