import 'dart:math';

import 'package:flutter/material.dart';

import '../Model/album_model.dart';

class Details extends StatelessWidget {
  final Album singleAlbum;
   Details({super.key, required this.singleAlbum});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Photo Details",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: NetworkImage(singleAlbum.url.toString()),),
              SizedBox(
                height: 20,
              ),
              Text("title: "+singleAlbum.title.toString()),
              SizedBox(height: 20,),
              Text("ID:"+singleAlbum.id.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
