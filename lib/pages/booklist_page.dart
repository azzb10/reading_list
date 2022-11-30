import 'package:flutter/material.dart';

class BooklistPage extends StatefulWidget {
  const BooklistPage({super.key});

  @override
  State<BooklistPage> createState() => _BooklistPageState();
}

class _BooklistPageState extends State<BooklistPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF1EF88),
      body: Center(
        child: Text('Booklist'),
      ),
    );
  }
}
