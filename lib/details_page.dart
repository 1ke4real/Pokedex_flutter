import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Details extends StatefulWidget {
  var name;
  var image;
  var sprite;
  Details({this.name, this.image, this.sprite});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Image.network(
            widget.sprite,
            height: 50,
          ),
          Text(widget.name)
        ]),
      ),
      body: Column(children: [
        Image.network(widget.image),
        Text(widget.name),
      ]),
    );
  }
}
