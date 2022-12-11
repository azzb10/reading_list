import 'package:flutter/material.dart';
import 'package:reading_list/models/book_model.dart';

class AddBookPage extends StatefulWidget {
  const AddBookPage({Key? key, this.book, required this.onSubmit})
      : super(key: key);

  final Function(BookModel) onSubmit;
  final BookModel? book;

  @override
  State<AddBookPage> createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  late GlobalKey<FormState> _formKey;
  late BookModel book;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    book = widget.book ?? BookModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1EF88),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 60),
                child: Text(
                  'Add your new book',
                  style: TextStyle(
                    color: Color(0xFF498C9A),
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(22),
                child: TextFormField(
                  initialValue: book.title,
                  onSaved: (title) => book.title = title!,
                  validator: (title) =>
                      title!.isEmpty ? 'Please type a title' : null,
                  decoration: const InputDecoration(
                    hintText: 'Title',
                    hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(22),
                child: TextFormField(
                  onSaved: (description) => book.description = description!,
                  initialValue: book.description,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    hintText: 'Description',
                    hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(28),
                child: Row(
                  children: [
                    const Text('Already read this book'),
                    Checkbox(
                        value: book.read,
                        onChanged: (value) {
                          setState(() {
                            book.read = value!;
                          });
                        })
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  final form = _formKey.currentState;
                  if (form!.validate()) {
                    form.save();
                    widget.onSubmit(book);
                    Navigator.of(context).pop();
                  }
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    backgroundColor: const Color(0xFFE67F22)),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
