import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'constants.dart';
import 'explore_page_utilities/post.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List<Widget> getPosts(List<dynamic> parsedJson) {
    List<Widget> temp = List();
    // print(parsedJson.length);
    for (int i = 0; i < parsedJson.length; i++) {
      temp.add(Post(description: parsedJson[i]['body']));
    }
    return temp;
  }

  Future<List<Widget>> fetchPosts() async {
    Client client = Client();
    Response response =
        await client.get(kApi2);
    // print(response.body);
    if (response.statusCode == 200)
      return getPosts(json.decode(response.body));
    else
      throw Exception('Failed to load post');
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    fetchPosts();
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Icon(
              Icons.arrow_back_ios,
              size: 17,
              color: Colors.black54,
            ),
            backgroundColor: Colors.white,
            centerTitle: true,
            elevation: .3,
            title: Text(
              'Explore',
              style: kStyle1,
            ),
            actions: [
              IconButton(
                color: Colors.black,
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
            ],
          ),
          backgroundColor: Colors.white,
          body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25.0,
              ),
              child: FutureBuilder(
                future: fetchPosts(),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData)
                    return ListView(
                      children: snapshot.data,
                    );
                  else
                    return Center(child: CircularProgressIndicator());
                },
              )),
        ),
      ),
    );
  }
}
