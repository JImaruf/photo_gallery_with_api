import 'dart:convert';

import 'package:flutter/material.dart';

import '../Model/album_model.dart';
import 'package:http/http.dart' as http;

import 'details.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Album> photoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text("Photo Gallery App",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if(photoList.isNotEmpty)
              {
                return ListView.builder(
                  itemCount: photoList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("" + photoList[index].title.toString()),
                      leading: Image(
                        image: NetworkImage(
                            photoList[index].thumbnailUrl.toString()),
                      ),
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Details(
                                singleAlbum: photoList[index],
                              ),
                            ));
                      },
                    );
                  },
                );
              }
            else
              {
                return Center(
                  child: Image(image: AssetImage("assets/pleasewait.gif"),),
                );
              }

          },
        ));
  }
  getData() async {
    var response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;

      for (Map i in data) {
        photoList.add(Album.fromJson(i));
      }
    }
  }
}
