class BookModel {
  BookModel({this.title = '', this.description = '', this.read = false});

  String title;
  String description;
  bool read;

  @override
  String toString() {
    return 'title: $title \ndescription: $description \nread $read';
  }
}
