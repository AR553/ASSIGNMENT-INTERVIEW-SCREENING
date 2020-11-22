import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'constants.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Widget getDetails(Map parsedJson, double width) {
    return Column(
      children: [
        SizedBox(
          height: width * .17,
          width: width * .17,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              parsedJson['data']['avatar'],
            ),
            onBackgroundImageError: (context, str) =>
                Center(child: Text("Image not found")),
            radius: 50,
            backgroundColor: Colors.black.withOpacity(0.1),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            parsedJson['data']['first_name'] +
                " " +
                parsedJson['data']['last_name'],
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),
        ),
      ],
    );
  }

  Future<Widget> fetchUserProfile(double width) async {
    Client client = Client();
    Response response = await client.get(kApi1);
    // print(response.body);
    if (response.statusCode == 200)
      return getDetails(json.decode(response.body), width);
    else
      throw Exception('Failed to load details');
  }

  List<Widget> getImages(double width) {
    List<Widget> temp = List();
    for (int i = 0; i < 20; i++)
      temp.add(ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.network(
          "https://picsum.photos/id/${20 * i}/200",
          width: width * 0.26,
        ),
      ));
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 17,
                color: Colors.black54,
              ),
            ),
            backgroundColor: Colors.white,
            centerTitle: true,
            elevation: 0.0,
            title: Text(
              'Profile',
              style: kStyle1,
            ),
            actions: [
              IconButton(
                color: Colors.black,
                icon: Icon(Icons.more_horiz_sharp),
                onPressed: () {},
              ),
            ],
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FutureBuilder(
                      future: fetchUserProfile(width),
                      builder: (BuildContext context, snapshot) {
                        if (snapshot.hasData)
                          return snapshot.data;
                        else
                          return Center(child: CircularProgressIndicator());
                      }),
                  Text(
                    "Description\n",
                    style: kStyle2,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Divider(
                    color: Colors.black26,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '438',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                            Text(
                              'Posts',
                              style: kStyle2,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '298',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                            Text(
                              'Following',
                              style: kStyle2,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '321K',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                            Text(
                              'Followers',
                              style: kStyle2,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.black38,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * .42,
                          height: width * .42 / 3,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(7.0),
                            child: RaisedButton(
                              onPressed: () {},
                              color: Color.fromRGBO(105, 121, 248, 1),
                              child: Center(
                                  child: Text(
                                "Follow",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                ),
                              )),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * .42,
                          height: width * .42 / 3,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.0),
                              border: Border.all(
                                color: Color.fromRGBO(105, 121, 248, 1),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(7.0),
                              child: RaisedButton(
                                color: Colors.white,
                                onPressed: () {},
                                child: Center(
                                    child: Text(
                                  "Message",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black,
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Photos",
                          style: kStyle1,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.format_list_bulleted,
                              size: 26,
                              color: Colors.black26,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.grid_view,
                              size: 26,
                              color: Colors.black26,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Wrap(
                    runSpacing: 10,
                    spacing: 10,
                    children: getImages(width),
                  ),
                  // Expanded(
                  //   child: GridView.count(
                  //     crossAxisCount: 3,
                  //     crossAxisSpacing: 10,
                  //     mainAxisSpacing: 10,
                  //     children: getImages(width),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
