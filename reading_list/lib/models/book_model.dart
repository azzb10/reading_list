class BookModel {
  BookModel({
    required this.id,
    this.title = '',
    this.description = '',
    this.read = false,
  });

  int id;
  String title;
  String description;
  bool read;

  @override
  bool operator ==(other) => other is BookModel && id == other.id;
  @override
  int get hashCode => id;

  @override
  String toString() {
    return 'title: $title \ndescription: $description \nread $read';
  }
}
