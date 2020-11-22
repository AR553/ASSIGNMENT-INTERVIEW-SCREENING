import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:interview_app/constants.dart';
import 'package:interview_app/profile_page.dart';

class Post extends StatelessWidget {
  Post({@required this.description});
  final String description;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: width * 0.05,
                backgroundImage:
                    NetworkImage("https://picsum.photos/id/512/200"),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfilePage()));
                        },
                        child: Text(
                          "Kristin Jones",
                          style: kStyle1.copyWith(fontSize: 14),
                        ),
                      ),
                      Text(
                        "20 Minutes ago",
                        style: kStyle2.copyWith(
                            fontSize: 12, color: Colors.black38),
                      ),
                    ],
                  ),
                ),
              ),
              Icon(
                Icons.more_horiz_rounded,
                size: 28,
                color: Colors.black26,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.mode_comment_outlined,
                      size: width * .08,
                      color: Colors.black54,
                    ),
                    Text(
                      "254",
                      style: kStyle2.copyWith(fontSize: 10),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Icon(
                      Icons.favorite_border_outlined,
                      size: width * .08,
                      color: Colors.pinkAccent,
                    ),
                    Text(
                      "3456",
                      style: kStyle2.copyWith(fontSize: 10),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: width * 0.12),
                    child: Column(
                      children: [
                        Text(
                          description,
                          overflow: TextOverflow.fade,
                          style: kStyle1.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(7),
                              child: Image.network(
                                  "https://picsum.photos/id/${Random().nextInt(10) * 10}/400/300")),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
