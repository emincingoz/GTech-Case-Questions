import 'package:api_reguest_list/data/obje_data.dart';
import 'package:flutter/material.dart';
import 'detail.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ObjeData objeData = ObjeData();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: objeData.fetchObjes(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const CircularProgressIndicator();
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: UniqueKey(),
                  child: ListTile(
                    title: Text(snapshot.data[index].id.toString()),
                    subtitle: Text(snapshot.data[index].title),
                    leading: Image.network(snapshot.data[index].thumbnailUrl,
                        scale: 1),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            id: snapshot.data[index].id,
                            title: snapshot.data[index].title,
                            url: snapshot.data[index].url,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        });
  }
}
