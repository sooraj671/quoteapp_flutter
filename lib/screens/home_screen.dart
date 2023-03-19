import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String quote = "";
  String author = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quote App")),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            quote,
            style: TextStyle(fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Text(
              '- $author',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        ElevatedButton(
            onPressed: () async {
              var url = Uri.parse('https://zenquotes.io/api/random');
              Response response = await http.get(url);
              var text = jsonDecode(response.body);

              quote = text[0]['q'];
              author = text[0]['a'];
              setState(() {});
            },
            child: Text('Get Quote'))
      ]),
    );
  }
}
