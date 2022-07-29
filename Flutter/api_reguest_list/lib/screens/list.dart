import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/obje.dart';
import 'detail.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

Future fetchObjes() async {
  var response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

  var objes = [];

  for (var u in jsonDecode(response.body)) {
    objes.add(Obje(
        albumId: u['albumId'],
        id: u['id'],
        title: u['title'],
        url: u['url'],
        thumbnailUrl: u['thumbnailUrl']));
  }

  print(objes[1]);

  return objes;
}

class _ListPageState extends State<ListPage> {
  //List<Obje> characterList;

  /*@override
  void initState() {
    super.initState();
    fetchObjes();
  }*/

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchObjes(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return const CircularProgressIndicator();
        } else {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(snapshot.data[index].id.toString()),
                subtitle: Text(snapshot.data[index].title),
                leading:
                    Image.network(snapshot.data[index].thumbnailUrl, scale: 1),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailPage(
                            id: snapshot.data[index].id,
                            title: snapshot.data[index].title,
                            url: snapshot.data[index].url,
                          )));
                },
              );
            },
          );
        }
      },
    );
  }
}
