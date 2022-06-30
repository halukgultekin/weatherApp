import 'package:flutter/material.dart';

class SehirSecWidget extends StatefulWidget {
  SehirSecWidget({Key? key}) : super(key: key);

  @override
  _SehirSecWidgetState createState() => _SehirSecWidgetState();
}

class _SehirSecWidgetState extends State<SehirSecWidget> {
  final _textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sehir Sec'),
      ),
      body: Form(
          child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _textcontroller,
                decoration: InputDecoration(
                  labelText: 'Sehir',
                  hintText: 'Sehir Secin',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.pop(context, _textcontroller.text);
              },
              icon: Icon(Icons.search))
        ],
      )),
    );
  }
}
