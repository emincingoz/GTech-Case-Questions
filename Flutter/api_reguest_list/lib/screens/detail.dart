import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final int id;
  final String title;
  final String url;
  const DetailPage({
    Key? key,
    required this.id,
    required this.title,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(id.toString())),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Center(
          child: Column(children: [
            Image.network(url),
            Text(
              title,
              style: TextStyle(fontSize: 20),
            )
          ]),
        ),
      ),
    );
  }
}
