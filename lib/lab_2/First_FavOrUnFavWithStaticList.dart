// Wap a create list with favorite and Unfavorite options Using Static List.

import 'package:flutter/material.dart';

class FavUnFavWithStaticList extends StatefulWidget {
  const FavUnFavWithStaticList({super.key});

  @override
  State<FavUnFavWithStaticList> createState() => _FavUnFavWithStaticListState();
}

class _FavUnFavWithStaticListState extends State<FavUnFavWithStaticList> {
  List<Map<String, dynamic>> favList = [
    {'name': 'Mansi', 'rollNo': 101, 'isFav': false},
    {'name': 'Khushi', 'rollNo': 102, 'isFav': false},
    {'name': 'Krishna', 'rollNo': 103, 'isFav': false},
    {'name': 'Bansi', 'rollNo': 104, 'isFav': false},
    {'name': 'Isha', 'rollNo': 105, 'isFav': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite/UnFavourite using static list"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: favList.length,
        itemBuilder: (context, index) {
          var item = favList[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 4,
            child: ListTile(
              title: Text(
                item['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Roll No: ${item['rollNo']}"),
              trailing: IconButton(
                onPressed: () {
                  setState(() {
                    favList[index]['isFav'] = !favList[index]['isFav'];
                  });
                },
                icon: Icon(
                  item['isFav'] ? Icons.favorite : Icons.favorite_border,
                  color: item['isFav'] ? Colors.lightGreen : Colors.grey,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
