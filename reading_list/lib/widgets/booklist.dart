import 'package:flutter/material.dart';
import 'package:reading_list/models/book_model.dart';
import 'package:reading_list/pages/add_book_page.dart';
import 'package:reading_list/widgets/horizontal_line.dart';

class Booklist extends StatelessWidget {
  final Set<BookModel> bookList;
  final Function(BookModel) onSubmit;
  final Function(BookModel) onDelete;

  const Booklist(
      {Key? key,
      required this.bookList,
      required this.onSubmit,
      required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, i) {
        final book = bookList.elementAt(i);
        return ListTile(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => AddBookPage(
                book: book,
                onSubmit: onSubmit,
              ),
            ),
          ),
          trailing: GestureDetector(
            onTap: () {
              onDelete(book);
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: Icon(Icons.delete_forever),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Text(
              book.title,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: book.read ? Colors.grey : Colors.black,
                decoration: book.read
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Text(
              book.description,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: book.read ? Colors.grey : Colors.black,
                decoration: book.read
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
              maxLines: 1,
            ),
          ),
          visualDensity: VisualDensity.compact,
          contentPadding: const EdgeInsets.all(0),
        );
      },
      separatorBuilder: (context, i) => const HorizontalLine(),
      itemCount: bookList.length,
    );
  }
}
