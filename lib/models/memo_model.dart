class MemoModel {
  int id;
  String title;
  String content;
  DateTime createdAt;

  MemoModel({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
  });

  @override
  String toString() {
    return 'MemoModel{id: $id, title: $title, content: $content, createdAt: $createdAt}';
  }
}
