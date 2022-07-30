import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/obje.dart';

class ObjeData {
  Future fetchObjes() async {
    var response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    var objes = [];

    for (var u in jsonDecode(response.body)) {
      objes.add(Obje(
          albumId: u['albumId'],
          id: u['id'],
          title: u['title'],
          url: u['url'],
          thumbnailUrl: u['thumbnailUrl']));
    }

    //print(objes[1]);

    return objes;
  }
}
