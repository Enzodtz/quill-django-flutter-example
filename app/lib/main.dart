import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/models/documents/document.dart';
import 'package:flutter_quill/models/quill_delta.dart';
import 'package:flutter_quill/widgets/controller.dart';
import 'package:flutter_quill/widgets/editor.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quill test App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List quillList = [];
  QuillController controller;
  bool fetching = true;

  void fetchAPI() async {
    var response = await http.get(Uri(
      scheme: "http",
      host: "192.168.0.4",
      port: 8000,
      path: "/description",
    ));

    quillList = jsonDecode(response.body)['ops'];

    controller = QuillController(
      selection: const TextSelection.collapsed(offset: 0),
      document: Document.fromDelta(
        Delta.fromJson(quillList),
      ),
    );
    setState(() {
      fetching = false;
    });
  }

  @override
  void initState() {
    fetchAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: fetching
          ? Center(
              child: CircularProgressIndicator(),
            )
          : QuillEditor.basic(
              controller: controller,
              readOnly: true, // true for view only mode
            ),
    );
  }
}
