class NoteTitle {
  String title;
  String note;

  NoteTitle(String title, String note) {
    this.title = title;
    this.note = note;
  }
}

List<NoteTitle> allDestinations = <NoteTitle>[
  NoteTitle('Title 1', 'Icons.home, Colors.teal'),
  NoteTitle('Title 2', 'Icons.business, Colors.cyan'),
  NoteTitle('School', 'Icons.school, Colors.orange'),
  NoteTitle('Flight', 'Icons.flight, Colors.blue')
];