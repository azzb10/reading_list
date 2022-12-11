import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reading_list/models/book_model.dart';
import 'package:reading_list/pages/add_book_page.dart';
import 'package:reading_list/widgets/booklist.dart';
import 'package:reading_list/widgets/horizontal_line.dart';

class BooklistPage extends StatefulWidget {
  const BooklistPage({super.key});

  @override
  State<BooklistPage> createState() => _BooklistPageState();
}

class _BooklistPageState extends State<BooklistPage> {
  late List<BookModel> myBooks;

  @override
  void initState() {
    myBooks = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1EF88),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 55),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Booklist...',
                          style: TextStyle(
                              color: Color(0xFF498C9A),
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => AddBookPage(
                                  onSubmit: (book) {
                                    setState(
                                      () {
                                        myBooks.add(book);
                                      },
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                          mini: true,
                          child: const Icon(
                            Icons.add,
                          ),
                        )
                      ],
                    ),
                  ),
                  const HorizontalLine(),
                  Booklist(
                      bookList: myBooks,
                      onSubmit: (book) {
                        setState(() {
                          myBooks.add(book);
                        });
                      }),
                  if (myBooks.isNotEmpty) const HorizontalLine(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35.0),
            child: VerticalDivider(
              color: Colors.red[200],
              thickness: 3,
            ),
          )
        ],
      ),
    );
  }
}
