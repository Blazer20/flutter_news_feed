import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_news_feed/network/model/News.dart';
import 'package:intl/intl.dart';

class MyCard extends StatelessWidget {
  final News model;

  const MyCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: model.articles!.length,
      itemBuilder: (context, position) {
        return Card(
          elevation: 5.0,
          margin: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 15.0,
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(0.0),
                      child: Text(
                        model.articles![position].author.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        DateFormat.yMMMd()
                            .format(DateTime.parse(model
                                .articles![position].publishedAt
                                .toString()))
                            .toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Image.network(
                  model.articles![position].urlToImage != null
                      ? model.articles![position].urlToImage.toString()
                      : 'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  alignment: Alignment.center,
                  child: Text(
                    model.articles![position].content.toString(),
                    style: const TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
